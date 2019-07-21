//
//  AlbumsListViewController.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import MBProgressHUD

class AlbumsListViewController: UIViewController {
    let numberOfItemPerRow: CGFloat = 3
    let lineSpacing: CGFloat = 10
    let interItemSpacing: CGFloat = 10

    // MARK: - Properties

    var presenter: AlbumsListPresenterProtocol?
    private static let commentCellId = "commentCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!

    // MARK: - Outlets

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }

    // MARK: - Setup

    private func setup() {
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.title = "Альбомы"
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                                forCellWithReuseIdentifier: AlbumsListViewController.commentCellId)
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {

            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width

            collectionViewFlowLayout = UICollectionViewFlowLayout()

            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing

            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: false)
        }
    }

    // MARK: - Private

    private func getPresenter() -> AlbumsListPresenterProtocol {
        guard let presenter = presenter else {
            fatalError("Could not get presenter")
        }
        return presenter
    }

}

// MARK: - AlbumsListViewProtocol

extension AlbumsListViewController: AlbumsListViewProtocol {

    func reloadCollection() {
        collectionView.reloadData()
    }

    func showDetailAlbumControllerWithCollectionId(_ collectionId: Int, _ image: UIImage) {
        let viewController = ViewControllerFactory.makeDetailAlbumViewController(collectionId, image)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: - MBProgressHUD

    func startPreloader() {
        MBProgressHUD.showAdded(to: view, animated: true).isUserInteractionEnabled = true
    }

    func stopPreloader() {
        MBProgressHUD.hide(for: view, animated: true)
    }

}

// MARK: - UISearchBarDelegate

extension AlbumsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            getPresenter().onUserSelectedSearchString(searchText)
        }
    }

}

// MARK: - UICollectionViewDataSource

extension AlbumsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getPresenter().getAlbumsCount()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsListViewController.commentCellId,
                                                      for: indexPath)
        guard let commentCell = cell as? CommentCell else {
            fatalError("Cell is not CommentCell")
        }

        commentCell.setupCell(getPresenter().getAlbumImageAtIndex(indexPath.row))
        return commentCell
    }

}

// MARK: - UICollectionViewDelegate

extension AlbumsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getPresenter().onUserSelectedAlbumAtIndex(indexPath.row)
    }
}
