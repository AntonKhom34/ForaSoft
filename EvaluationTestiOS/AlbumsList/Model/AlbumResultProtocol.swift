//
//  AlbumResultProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 19/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

protocol AlbumResultProtocol {
    var image: UIImage { get }
    var collectionId: Int { get }
    var collectionPrice: Float { get }
    var collectionName: String { get }
    var artistName: String { get }
}
