//
//  AlbumResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 19/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AlbumResult: AlbumResultProtocol {
    var image: UIImage
    var collectionId: Int
    var collectionPrice: Float
    var collectionName: String
    var artistName: String

    init(image: UIImage, collectionId: Int, collectionPrice: Float, collectionName: String, artistName: String) {
        self.image = image
        self.collectionId = collectionId
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.artistName = artistName
    }
}
