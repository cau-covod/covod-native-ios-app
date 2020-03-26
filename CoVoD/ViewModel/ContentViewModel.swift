//
//  ContentViewModel.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Combine
import Dispatch
import Logging

fileprivate let log = Logger(label: "ContentViewModel")

class ContentViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var showCoursesErrorAlert: Bool = false
    @Published var authentication: ServerAuthentication? = nil {
        willSet {
            if let auth = newValue {
                APIRequest<[Feed]>(authentication: auth, endpoint: "/user/feed").perform { result in
                    log.info("Fetched user feed")
                    DispatchQueue.main.async {
                        switch result {
                        case let .success(feeds):
                            self.courses = feeds.flatMap { $0.courses }
                        case let .failure(error):
                            print(error)
                            self.showCoursesErrorAlert = true
                        }
                    }
                }
            } else {
                log.info("Resetting user feed")
                courses = []
            }
        }
    }
}
