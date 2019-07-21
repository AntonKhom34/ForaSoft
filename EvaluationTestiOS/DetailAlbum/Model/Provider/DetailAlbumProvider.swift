//
//  DetailAlbumProvider.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class DetailAlbumProvider {
    var service: AlbumDetailServiesProtocol

    // MARK: - Init

    init(service: AlbumDetailServiesProtocol) {
        self.service = service
    }
}

// MARK: - DetailAlbumProviderProtocol

extension DetailAlbumProvider: DetailAlbumProviderProtocol {

    func getAlbumDetail(_ colletionId: Int, onComplete: @escaping ([DetailAlbumResult]) -> Void) {
        service.getAlbumDetail(colletionId, onComplete: { songs in
            DispatchQueue.main.async {
                onComplete(songs)
            }
        })
    }

}
