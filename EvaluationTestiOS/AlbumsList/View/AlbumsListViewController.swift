//
//  AlbumsListViewController.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AlbumsListViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: AlbumsListPresenterProtocol?

    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
