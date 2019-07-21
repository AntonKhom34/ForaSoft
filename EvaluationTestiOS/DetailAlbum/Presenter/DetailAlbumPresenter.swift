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
    var album: AlbumResult

    // MARK: - Init

    init(view: DetailAlbumViewProtocol, provider: DetailAlbumProviderProtocol, album: AlbumResult) {
        self.view = view
        self.provider = provider
        self.album = album
        detailalbum = []
    }

}

// MARK: - DetailAlbumPresenterProtocol

extension DetailAlbumPresenter: DetailAlbumPresenterProtocol {
    func tracksCount() -> Int {
        return detailalbum.count
    }

    func onViewDidLoad() {
        setAlbumInfo()
        provider.getAlbumDetail(album.collectionId) { [weak self] detailalbum in
            guard let strongSelf = self else {
                return
            }
            strongSelf.detailalbum = detailalbum
            strongSelf.view.reloadTable()
        }
    }

    func getTrackAtIndex(_ index: Int) -> DetailAlbumResult {
        return detailalbum[index]
    }

    // MARK: - Private

    private func setAlbumInfo() {
        view.setAlbumName(album.collectionName)
        view.setAlbumPrice(album.collectionPrice)
        view.setupAlbumLogo(album.image)
        view.setAlbumArtistName(album.artistName)
    }

}
