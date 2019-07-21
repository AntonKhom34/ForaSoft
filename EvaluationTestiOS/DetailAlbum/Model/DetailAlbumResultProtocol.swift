//
//  DetailAlbumResultProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol DetailAlbumResultProtocol {
    var wrapperType: String { get }
    var trackName: String? { get }
    var trackPrice: Float? { get }
    var primaryGenreName: String? { get }
    var trackNumber: Int? { get }
}
