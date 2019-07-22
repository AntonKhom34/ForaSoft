//
//  CommentCell.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 19/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import Kingfisher

class CommentCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var imageView: UIImageView!

    // MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - SetupCell

    func setupCell(_ url: URL) {
        imageView.kf.setImage(with: url)
    }

}

// MARK: - Extensions

extension CommentCell {
    static let nibName = "CommentCell"
}
