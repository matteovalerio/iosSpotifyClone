//
//  Artist.swift
//  Spotify
//
//  Created by Matteo Valerio on 11/11/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
