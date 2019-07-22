//
//  DetailTrackResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class DetailTrackResult: DetailTrackResultProtocol, Codable {
    var wrapperType: String
    var trackName: String
    var trackPrice: Float
    var primaryGenreName: String
    var trackNumber: Int
}
