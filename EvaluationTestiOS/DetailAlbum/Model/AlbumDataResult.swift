//
//  AlbumDataResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumDataResult: AlbumDataResultProtocol, Codable {
    var results: [DetailTrackResult]
}
