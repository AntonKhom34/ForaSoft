//
//  DetailAlbumViewProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol DetailAlbumViewProtocol {
    func setupAlbumInfo(_ url: URL,
                        _ albumArtistName: String,
                        _ albumName: String,
                        _ price: Double?,
                        _ genreName: String)
    func reloadTable()
}
