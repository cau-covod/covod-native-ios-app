//
//  CommentsViewModel.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Combine
import Dispatch

public class CommentsViewModel: ObservableObject {
    @Published public var comments: [Comment] = []
    @Published public var lecture: Lecture
    
    public init(lecture: Lecture, authentication: Authentication) {
        self.lecture = lecture
        
        APIRequest<Comments>(authentication: authentication, endpoint: "/lecture/\(lecture.id)/comments").perform {
            switch $0 {
            case .success(let comments):
                DispatchQueue.main.async {
                    self.comments = comments.comments
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
