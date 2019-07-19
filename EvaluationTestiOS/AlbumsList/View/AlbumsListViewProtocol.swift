//
//  AlbumsListViewProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol AlbumsListViewProtocol: class {
    func startPreloader()
    func stopPreloader()
    func reloadCollection()
    func showDetailAlbumControllerWithCollectionId(_ collectionId: Int)
}
