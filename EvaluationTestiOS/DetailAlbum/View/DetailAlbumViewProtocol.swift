//
//  DetailAlbumViewProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

protocol DetailAlbumViewProtocol {
    func setupAlbumLogo(_ albumLogo: UIImage)
    func setAlbumPrice(_ price: Float)
    func setAlbumName(_ albumName: String)
    func setAlbumArtistName(_ albumAutorName: String)
    func reloadTable()
}
