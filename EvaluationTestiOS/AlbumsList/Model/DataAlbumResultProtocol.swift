//
//  DataAlbumResultProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol DataAlbumResultProtocol {
    var artworkUrl100: URL { get }
    var collectionId: Int { get }
    var collectionPrice: Double? { get }
    var collectionName: String { get }
    var artistName: String { get }
    var primaryGenreName: String { get }
}
