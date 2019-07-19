//
//  DataAlbumsResult.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class DataAlbumsResult: DataAlbumsResultProtocol, Codable {
    var results: [DataAlbumResult]
}
