//
//  DataAlbumResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class DataAlbumResult: DataAlbumResultProtocol, Codable {
    var collectionPrice: Float
    var collectionName: String
    var collectionId: Int
    var artworkUrl100: URL
    var artistName: String
}
