//
//  DetailAlbumViewController.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class DetailAlbumViewController: UIViewController {
    // MARK: - Properties

    var presenter: DetailAlbumPresenterProtocol?
    private static let commentCellId = "commentTableCell"

    // MARK: - Outlets

    @IBOutlet private weak var albumLogoImage: UIImageView!
    @IBOutlet private weak var albomNameLabel: UILabel!
    @IBOutlet private weak var albumArtistNameLabel: UILabel!
    @IBOutlet private weak var albomPriceLabel: UILabel!
    @IBOutlet private weak var genreNameLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        getPresenter().onViewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: CommentTableCell.nibName, bundle: nil),
                           forCellReuseIdentifier: DetailAlbumViewController.commentCellId)
        tableView.separatorColor = UIColor.clear
    }

    // MARK: - Private

    private func getPresenter() -> DetailAlbumPresenterProtocol {
        guard let presenter = presenter else {
            fatalError("Could not get presenter")
        }
        return presenter
    }

}

// MARK: - DetailAlbumViewProtocol

extension DetailAlbumViewController: DetailAlbumViewProtocol {
    func reloadTable() {
        tableView.reloadData()
    }

    func setupAlbumInfo(_ url: URL,
                        _ albumArtistName: String,
                        _ albumName: String,
                        _ price: Double?,
                        _ genreName: String) {
        albumLogoImage.kf.setImage(with: url)
        albumArtistNameLabel.text = "DetailAlbum_ArtistName".localize() + albumArtistName
        albomNameLabel.text = "DetailAlbum_AlbomName".localize() + albumName
        genreNameLabel.text = "DetailAlbum_GenreName".localize() + genreName
        guard let price = price else {
            return
        }
        albomPriceLabel.text = "DetailAlbum_AlbomPrice".localize() + "\(price)" + "DetailAlbum_Currency".localize()
    }

}

// MARK: - UITableViewDataSource

extension DetailAlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getPresenter().tracksCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailAlbumViewController.commentCellId,
                                                 for: indexPath)
        guard let commentCell = cell as? CommentTableCell else {
            fatalError("Cell is not CommentCell")
        }

        commentCell.setupCell(getPresenter().getTrackAtIndex(indexPath.row))

        return commentCell
    }

}
