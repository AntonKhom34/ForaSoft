//
//  ViewControllerFactory.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class ViewControllerFactory {

    // MARK: - AlbumsListViewController

    static func makeAlbumsListViewController() -> UIViewController {
        let view = AlbumsListViewController()
        let presenter = AlbumsListPresenter(view: view,
                                            provider: AlbumsListProvider(service: ApiServies()))

        view.presenter = presenter

        return view
    }

    // MARK: - DetailAlbum

    static func makeDetailAlbumViewController(_ collectionID: Int, _ image: UIImage) -> UIViewController {
        let view = DetailAlbumViewController()
        let presenter = DetailAlbumPresenter(view: view,
                                             provider: DetailAlbumProvider(service: AlbumDetailServies()),
                                             collectionID: collectionID,
                                             image: image)

        view.presenter = presenter

        return view
    }

}
