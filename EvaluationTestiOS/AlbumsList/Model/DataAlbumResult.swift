//
//  DataAlbumResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class DataAlbumResult: DataAlbumResultProtocol, Codable {
    var artworkUrl100: URL
    var collectionId: Int
    var collectionPrice: Double?
    var collectionName: String
    var artistName: String
    var primaryGenreName: String
}
