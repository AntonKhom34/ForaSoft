//
//  AlbumsListViewController.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import MBProgressHUD
import IQKeyboardManagerSwift

class AlbumsListViewController: UIViewController {

    // MARK: - Const

    private let footerViewHeight: CGFloat = 50
    private let commentCellId = "commentCell"
    private let footerViewIdentifier = "footerView"
    private let collectionItemSize = 100

    // MARK: - Properties

    var presenter: AlbumsListPresenterProtocol?
    var collectionViewFlowLayout: UICollectionViewFlowLayout?

    // MARK: - Outlets

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!

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
        navigationController?.navigationBar.topItem?.title = "AlbumsList_Title".localize()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                                forCellWithReuseIdentifier: commentCellId)
        collectionView.register(UINib(nibName: FooterView.nibName, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: footerViewIdentifier)
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            getCollectionViewFlowLayout().itemSize = CGSize(width: collectionItemSize, height: collectionItemSize)
            collectionView.setCollectionViewLayout(getCollectionViewFlowLayout(), animated: false)
        }
    }

    // MARK: - Private

    private func getPresenter() -> AlbumsListPresenterProtocol {
        guard let presenter = presenter else {
            fatalError("Could not get presenter")
        }
        return presenter
    }

    private func getCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        guard let collectionViewFlowLayout = collectionViewFlowLayout else {
            fatalError("Could not get collectionViewFlowLayout")
        }
        return collectionViewFlowLayout
    }

    // MARK: Events

    @IBAction func tappedInFooter() {
        getPresenter().onUserSelectedLoadMore()
    }

}

// MARK: - AlbumsListViewProtocol

extension AlbumsListViewController: AlbumsListViewProtocol {

    func reloadCollection() {
        collectionView.reloadData()
    }

    func showDetailAlbumControllerWithCollectionId(album: DataAlbumResult) {
        let viewController = ViewControllerFactory.makeDetailAlbumViewController(album: album)
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
            let correctSearchText = searchText.replacingOccurrences(of: " ", with: "+")
            getPresenter().onUserChangedSearchStringTo(correctSearchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getPresenter().onUserKeyboardSearchButtonPressed()
        view.endEditing(true)
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getPresenter().getAlbumsCount()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commentCellId, for: indexPath)
        guard let commentCell = cell as? CommentCell else {
            fatalError("Cell is not CommentCell")
        }

        commentCell.setupCell(getPresenter().getAlbumImageAtIndex(indexPath.row))
        return commentCell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: footerViewIdentifier, for: indexPath)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedInFooter))
            footerView.addGestureRecognizer(tapGestureRecognizer)
            return footerView
        } else {
                return UICollectionReusableView()
            }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AlbumsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        if searchBar.text != "" {
            let size = CGSize(width: view.frame.width, height: footerViewHeight)
            return size
        }
        return CGSize.zero
    }

}

// MARK: - UICollectionViewDelegate

extension AlbumsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getPresenter().onUserSelectedAlbumAtIndex(indexPath.row)
    }

}
