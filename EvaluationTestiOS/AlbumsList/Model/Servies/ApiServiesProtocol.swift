//
//  ApiServiesProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol ApiServiesProtocol {
    func getAlbumsWithSearchString(_ searchString: String,
                                   _ albumsCount: Int,
                                   onComplete: @escaping ([DataAlbumResult]) -> Void)
}
