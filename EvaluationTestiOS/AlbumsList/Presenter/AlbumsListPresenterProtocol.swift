//
//  AlbumsListPresenterProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

protocol AlbumsListPresenterProtocol: class {
    func onUserSelectedSearchString(_ searchString: String)
    func getAlbumsCount() -> Int
    func getAlbumImageAtIndex(_ index: Int) -> URL
    func onUserSelectedAlbumAtIndex(_ selectedAlbumIndex: Int)
    func onUserSelectedLoadTenMore(_ searchString: String)
}
