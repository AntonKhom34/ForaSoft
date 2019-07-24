//
//  FooterView.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 24/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class FooterView: UICollectionReusableView {

    // MARK: - Outlets

    @IBOutlet private weak var loadLabel: UILabel!

    // MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        localize()
    }

    // MARK: - Private

    private func localize() {
        loadLabel.text = "Footer_Text".localize()
    }

}

// MARK: - Extensions

extension FooterView {
    static let nibName = "FooterView"
}
