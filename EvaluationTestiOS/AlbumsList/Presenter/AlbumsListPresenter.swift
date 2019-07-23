//
//  AlbumsListPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AlbumsListPresenter {
    var albums: [DataAlbumResult]
    var lastRequestId: UUID?
    var albumsCount = 10

    // MARK: - Properties

    unowned var view: AlbumsListViewProtocol
    private let provider: AlbumsListProviderProtocol

    // MARK: - init

    init(view: AlbumsListViewProtocol, provider: AlbumsListProviderProtocol) {
        self.view = view
        self.provider = provider
        albums = []
        lastRequestId = nil
    }

}

// MARK: - AlbumsListPresenterProtocol

extension AlbumsListPresenter: AlbumsListPresenterProtocol {

    func onUserSelectedSearchString(_ searchString: String) {
        albumsCount = 10
        lastRequestId = UUID.init()
        getAlbumsWithSearchString(searchString)
    }

    func getAlbumsCount() -> Int {
        return albums.count
    }

    func getAlbumImageAtIndex(_ index: Int) -> URL {
        return albums[index].artworkUrl100
    }

    func onUserSelectedAlbumAtIndex(_ selectedAlbumIndex: Int) {
        view.showDetailAlbumControllerWithCollectionId(album: albums[selectedAlbumIndex])
    }

    func onUserSelectedLoadTenMore(_ searchString: String) {
        albumsCount += 10
        lastRequestId = UUID.init()
        getAlbumsWithSearchString(searchString)
    }

    // MARK: - Private

    private func getAlbumsWithSearchString(_ searchString: String) {
        view.startPreloader()
        provider.getAlbumsWithSearchString(searchString, albumsCount) { [weak self, lastRequestId] albums in
            guard let strongSelf = self else {
                return
            }
            if lastRequestId == strongSelf.lastRequestId {
                strongSelf.view.stopPreloader()
                strongSelf.albums = albums
                strongSelf.view.reloadCollection()
            } else {
                strongSelf.view.stopPreloader()
            }
        }
    }
}
