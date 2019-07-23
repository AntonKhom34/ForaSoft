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
    @IBOutlet private weak var trackTimeLabel: UILabel!

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
        let trackNumber = detailAlbumResult.trackNumber
        trackNumberLabel.text = "\(trackNumber)"
        setTrackTime(detailAlbumResult)
        setTrackPrice(detailAlbumResult.trackPrice)
    }

    // MARK: - Private

    private func setTrackPrice(_ trackPrice: Float?) {
        guard let trackPrice = trackPrice else {
            return
        }
        trackPriceLabel.text = "\(trackPrice)$"
    }

    private func setTrackTime(_ detailAlbumResult: DetailTrackResult) {
        guard let trackTime = detailAlbumResult.trackTimeMillis else {
            return
        }
        trackTimeLabel.text = stringFromTimeInterval(trackTime)
    }

    private func stringFromTimeInterval(_ timeMS: Int) -> String {
        let timeSecons = timeMS / 1000
        let minutes = (timeSecons % 3600) / 60
        let seconds = (timeSecons % 3600) % 60

        return String(format: "%d:%0.2d", minutes, seconds)
    }

}

// MARK: - Extensions

extension CommentTableCell {
    static let nibName = "CommentTableCell"
}
