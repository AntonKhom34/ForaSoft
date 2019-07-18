//
//  AlbumsListProviderProtocol.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol AlbumsListProviderProtocol {
    func getAlbumsWithSearchBar(searchBar: String, onComplete: @escaping ([AlbumResult]) -> Void)
}
