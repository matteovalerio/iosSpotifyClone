//
//  SettingsModels.swift
//  Spotify
//
//  Created by Matteo Valerio on 11/11/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
