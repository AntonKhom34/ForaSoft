//
//  AlbumsListPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AlbumsListPresenter {
    let albumsCountDefault = 20
    var albumsCount = 20

    var albums: [DataAlbumResult]
    var lastRequestId: UUID?
    var searchBarText: String

    // MARK: - Properties

    unowned var view: AlbumsListViewProtocol
    private let provider: AlbumsListProviderProtocol

    // MARK: - init

    init(view: AlbumsListViewProtocol, provider: AlbumsListProviderProtocol) {
        self.view = view
        self.provider = provider
        albums = []
        lastRequestId = nil
        searchBarText = ""
    }

}

// MARK: - AlbumsListPresenterProtocol

extension AlbumsListPresenter: AlbumsListPresenterProtocol {

    func onUserChangedSearchStringTo(_ searchString: String) {
        searchBarText = searchString
        albumsCount = albumsCountDefault
        lastRequestId = UUID.init()
        getAlbums()
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

    func onUserSelectedLoadMore() {
        albumsCount += albumsCountDefault
        lastRequestId = UUID.init()
        getAlbums()
    }

    func onUserKeyboardSearchButtonPressed() {
        albumsCount = albumsCountDefault
        lastRequestId = UUID.init()
        getAlbums()
    }

    // MARK: - Private

    private func getAlbums() {
        view.startPreloader()
        provider.getAlbumsWithSearchString(searchBarText, albumsCount) { [weak self, lastRequestId] albums in
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
