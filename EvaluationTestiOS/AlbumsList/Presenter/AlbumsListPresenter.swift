//
//  AlbumsListPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumsListPresenter {
    var albums: [AlbumResult]

    // MARK: - Properties

    unowned var view: AlbumsListViewProtocol
    private let provider: AlbumsListProviderProtocol

    // MARK: - init

    init(view: AlbumsListViewProtocol, provider: AlbumsListProviderProtocol) {
        self.view = view
        self.provider = provider
        albums = []
    }

}

// MARK: - AlbumsListPresenterProtocol

extension AlbumsListPresenter: AlbumsListPresenterProtocol {

    // MARK: - Private

    private func showJokesWithCount(_ searchBar: String) {
        view.startPreloader()
        provider.getAlbumsWithSearchBar(searchBar: searchBar) { [weak self] albums in
            guard let strongSelf = self else {
                return
            }
            strongSelf.view.stopPreloader()
            strongSelf.albums = albums
            //strongSelf.view.reloadTable()
        }
    }
}
