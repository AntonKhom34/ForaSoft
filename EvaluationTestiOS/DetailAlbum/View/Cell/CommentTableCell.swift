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

    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var trackNumberLabel: UILabel!
    @IBOutlet private weak var trackPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - SetupCell

    func setupCell(_ detailAlbumResult: DetailTrackResult) {
        trackNameLabel.text = detailAlbumResult.trackName
        let trackPrice = detailAlbumResult.trackPrice
        trackPriceLabel.text = "\(trackPrice)$"
        let trackNumber = detailAlbumResult.trackNumber
        trackNumberLabel.text = "\(trackNumber)"
    }

}

// MARK: - Extensions

extension CommentTableCell {
    static let nibName = "CommentTableCell"
}
