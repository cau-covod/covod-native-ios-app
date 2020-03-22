//
//  PlayerView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation
import SwiftUI

struct PlayerView: UIViewRepresentable {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func updateUIView(_ uiView: PlayerView.UIViewType, context: UIViewRepresentableContext<PlayerView>) {}
    
    func makeUIView(context: UIViewRepresentableContext<PlayerView>) -> UIView {
        return PlayerUIView(frame: .zero, url: url)
    }
}
