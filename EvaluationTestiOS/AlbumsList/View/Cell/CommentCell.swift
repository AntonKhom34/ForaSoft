//
//  CommentCell.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 19/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - SetupCell

    func setupCell(_ image: UIImage) {
        imageView.image = image
    }

}

// MARK: - Extensions

extension CommentCell {
    static let nibName = "CommentCell"
}
