//
//  AlbumDetailServiesProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol AlbumDetailServiesProtocol {
    func getAlbumDetail(_ colletionId: Int, onComplete: @escaping ([DetailAlbumResult]) -> Void)
}
