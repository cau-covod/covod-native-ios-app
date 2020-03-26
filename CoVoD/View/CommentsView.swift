//
//  CommentsView.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject private var viewModel: CommentsViewModel
    @State private var commentText: String = ""
    
    init(lecture: Lecture, authentication: ServerAuthentication) {
        viewModel = CommentsViewModel(lecture: lecture, authentication: authentication)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Comment", text: $commentText)
                Button(action: {
                    self.viewModel.submit(comment: self.commentText)
                    self.commentText = ""
                }) {
                    Text("Post")
                }
            }
                .padding(5.0)
            if !viewModel.comments.isEmpty {
                List {
                    ForEach(viewModel.comments) { comment in
                        Section {
                            self.viewFor(comment: comment)
                            ForEach(comment.flatReplies) { reply in
                                self.viewFor(comment: reply)
                            }
                        }
                    }
                }
                    .listStyle(GroupedListStyle())
            } else {
                Text("\(viewModel.lecture.commentCount ?? 0) \("comment".pluralize(with: viewModel.lecture.commentCount ?? 0))")
            }
        }
    }
    
    private func viewFor(comment: Comment) -> some View {
        return Text(comment.text.map { "\(comment.user?.username ?? "Anonymous user"): \($0)" } ?? "no text")
    }
}
