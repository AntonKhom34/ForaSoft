//
//  AlbumsListPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AlbumsListPresenter {
    var albums: [AlbumResult]
    var lastRequestId: UUID?

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
        lastRequestId = UUID.init()
        getAlbumsWithSearchString(searchString)
    }

    func getAlbumsCount() -> Int {
        return albums.count
    }

    func getAlbumImageAtIndex(_ index: Int) -> UIImage {
        return albums[index].image
    }

    func onUserSelectedAlbumAtIndex(_ selectedAlbumIndex: Int) {
        view.showDetailAlbumControllerWithCollectionId(albums[selectedAlbumIndex].collectionId,
                                                       albums[selectedAlbumIndex].image)
    }

    // MARK: - Private

    private func getAlbumsWithSearchString(_ searchString: String) {
        view.startPreloader()
        provider.getAlbumsWithSearchString(searchString: searchString) { [weak self, lastRequestId] albums in
            guard let strongSelf = self else {
                return
            }
            if lastRequestId == strongSelf.lastRequestId {
                strongSelf.view.stopPreloader()
                strongSelf.albums = albums
                strongSelf.view.reloadCollection()
            } else {
                strongSelf.view.stopPreloader() // FIXME: - 
            }
        }
    }
}
