//
//  DetailAlbumViewController.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class DetailAlbumViewController: UIViewController {
    var presenter: DetailAlbumPresenterProtocol?

    // MARK: - Outlets

    @IBOutlet weak var albumLogoImage: UIImageView!
    @IBOutlet weak var albomNameLabel: UILabel!
    @IBOutlet weak var albomCoastLabel: UILabel!
    @IBOutlet weak var tracksLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        getPresenter().onViewDidLoad()
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
    func setLable(_ artistName: String) {
        //lable.text = artistName
    }

}
