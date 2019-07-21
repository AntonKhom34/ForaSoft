//
//  DetailAlbumPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class DetailAlbumPresenter {
    var detailalbum: [DetailAlbumResult]

    // MARK: - Properties

    var view: DetailAlbumViewProtocol
    var provider: DetailAlbumProviderProtocol
    var collectionID: Int
    var image: UIImage

    // MARK: - Init

    init(view: DetailAlbumViewProtocol, provider: DetailAlbumProviderProtocol, collectionID: Int, image: UIImage) {
        self.view = view
        self.provider = provider
        self.collectionID = collectionID
        self.image = image
        detailalbum = []
    }

}

// MARK: - DetailAlbumPresenterProtocol

extension DetailAlbumPresenter: DetailAlbumPresenterProtocol {
    func onViewDidLoad() {
        provider.getAlbumDetail(collectionID) { [weak self] detailalbum in
            guard let strongSelf = self else {
                return
            }
            strongSelf.detailalbum = detailalbum
        }
    }

}
