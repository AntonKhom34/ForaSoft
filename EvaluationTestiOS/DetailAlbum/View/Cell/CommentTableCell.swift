//
//  CommentTableCell.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 21/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentTableCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackNumberLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - SetupCell

    func setupCell(_ detailAlbumResult: DetailAlbumResult) {
        trackNameLabel.text = detailAlbumResult.trackName
        guard let trackPrice = detailAlbumResult.trackPrice else {
            return
        }
        trackPriceLabel.text = "\(trackPrice)$"
        guard let trackNumber = detailAlbumResult.trackNumber else {
            return
        }
        trackNumberLabel.text = "\(trackNumber)"
    }

}

// MARK: - Extensions

extension CommentTableCell {
    static let nibName = "CommentTableCell"
}
