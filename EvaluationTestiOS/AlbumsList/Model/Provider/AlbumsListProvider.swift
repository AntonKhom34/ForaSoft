//
//  AlbumsListProvider.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumsListProvider {

    // MARK: - Properties

    let service: ApiServiesProtocol

    // MARK: init

    init(service: ApiServiesProtocol) {
        self.service = service
    }
}

// MARK: - AlbumsListProviderProtocol

extension AlbumsListProvider: AlbumsListProviderProtocol {
    func getAlbumsWithSearchString(searchString: String, onComplete: @escaping ([DataAlbumResult]) -> Void) {
        service.getAlbumsWithSearchString(searchString: searchString, onComplete: { albums in
            DispatchQueue.main.async {
                onComplete(albums)
            }
        })
    }

}
