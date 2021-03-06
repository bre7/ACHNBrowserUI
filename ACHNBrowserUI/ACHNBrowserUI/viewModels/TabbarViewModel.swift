//
//  TabbarViewModel.swift
//  ACHNBrowserUI
//
//  Created by Thomas Ricouard on 05/06/2020.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Backend

class TabbarViewModel: ObservableObject {
    private let musicPlayerManager: MusicPlayerManager
    private var musicPlayerPlayingCancellable: AnyCancellable?
    
    @Published var showPlayerView = false
    
    init(musicPlayerManager: MusicPlayerManager) {
        self.musicPlayerManager = musicPlayerManager
        
        self.musicPlayerPlayingCancellable = musicPlayerManager.$isPlaying.sink
            { [weak self] in
                if $0 && self?.showPlayerView == false {
                    self?.showPlayerView = true
                }
        }
    }
}
