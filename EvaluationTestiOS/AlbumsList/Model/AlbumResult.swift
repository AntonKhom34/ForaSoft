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

    init(image: UIImage, collectionId: Int) {
        self.image = image
        self.collectionId = collectionId
    }
}
