//
//  DetailAlbumPresenterProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol DetailAlbumPresenterProtocol {
    func onViewDidLoad()
    func tracksCount() -> Int
    func getTrackAtIndex(_ index: Int) -> DetailTrackResult
}
