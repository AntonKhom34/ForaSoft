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

    @IBOutlet weak var albumLogoImage: UIImageView!
    @IBOutlet weak var albomNameLabel: UILabel!
    @IBOutlet weak var albumArtistNameLabel: UILabel!
    @IBOutlet weak var albomPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

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

    func setupAlbumLogo(_ albumLogo: UIImage) {
        albumLogoImage.image = albumLogo
    }

    func setAlbumArtistName(_ albumArtistName: String) {
        albumArtistNameLabel.text = "Исполнитель: \(albumArtistName)"
    }

    func setAlbumName(_ albumName: String) {
        albomNameLabel.text = "Альбом: \(albumName)"
    }

    func setAlbumPrice(_ price: Float) {
        albomPriceLabel.text = "Стоимость альбома: \(price)$"
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
