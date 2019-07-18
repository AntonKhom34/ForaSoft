//
//  AlbumsListPresenter.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumsListPresenter {

    // MARK: - Properties

    let view: AlbumsListViewProtocol
    let provider: AlbumsListProviderProtocol

    // MARK: - init

    init(view: AlbumsListViewProtocol, provider: AlbumsListProviderProtocol) {
        self.view = view
        self.provider = provider
    }

}

// MARK: - AlbumsListPresenterProtocol

extension AlbumsListPresenter: AlbumsListPresenterProtocol {
}
