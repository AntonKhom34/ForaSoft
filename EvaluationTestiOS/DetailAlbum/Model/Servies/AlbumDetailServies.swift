//
//  AlbumDetailServies.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumDetailServies {
    let itunceApiUrl = "https://itunes.apple.com/lookup?id="
    let entityMethod = "&entity=song"
}

// MARK: - AlbumDetailServiesProtocol

extension AlbumDetailServies: AlbumDetailServiesProtocol {
    func getAlbumDetail(_ colletionId: Int, onComplete: @escaping ([DetailTrackResult]) -> Void) {
        URLSession.shared.dataTask(with: getURLWithCollectionID(colletionId)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            onComplete(AlbumDetailParser().getAlbumDetailsWithData(data))

        }.resume()
    }

    // MARK: - Private

    private func getURLWithCollectionID(_ collectionID: Int) -> URL {
        let urlString = itunceApiUrl + "\(collectionID)" + entityMethod
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }

}
