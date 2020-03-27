//
//  PlayerView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit
import SwiftUI
import Logging

fileprivate let log = Logger(label: "PlayerView")

struct PlayerView: UIViewControllerRepresentable {
    private let url: URL
    private let headers: [String: String]
    
    init(url: URL, headers: [String: String]) {
        self.url = url
        self.headers = headers
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PlayerView>) {}
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlayerView>) -> UIViewController {
        log.info("Playing \(url)")
        let asset = AVURLAsset(url: url, options: [
            "AVURLAssetHTTPHeaderFieldsKey": headers
        ])
        let item = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: item)
        let vc = AVPlayerViewController()
        vc.player = player
        player.play()
        return vc
    }
}
