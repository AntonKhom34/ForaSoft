//
//  ApiServies.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class ApiServies {
    private let apiUrl = "https://itunes.apple.com/search?"
    private let entityAndLimitString = "&entity=album&limit=10"
}

// MARK: - ApiServiesProtocol

extension ApiServies: ApiServiesProtocol {
    func getAlbumsWithSearchString(searchString: String, onComplete: @escaping ([AlbumResult]) -> Void) {
        URLSession.shared.dataTask(with: getUrlWithSearchBar(searchString)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(DataAlbumsResult.self, from: data)
                onComplete(self.getImage(dataResult.results))
            } catch {
                onComplete([])
            }
            }.resume()
    }

    // MARK: - Private

    private func getUrlWithSearchBar(_ searchString: String) -> URL {
        let urlString = apiUrl + "term=\(searchString)" + entityAndLimitString
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }

    private func getImage(_ albums: [DataAlbumResult]) -> [AlbumResult] {
        var albumResultsDictionary: [AlbumResult] = []

        for album in albums {
            if let data = try? Data(contentsOf: album.artworkUrl100) {
                let image = UIImage(data: data)
                if image != nil {
                    let albumResultDictionary = AlbumResult.init(image: image!,
                                                                 collectionId: album.collectionId,
                                                                 collectionPrice: album.collectionPrice,
                                                                 collectionName: album.collectionName,
                                                                 artistName: album.artistName)
                    albumResultsDictionary.append(albumResultDictionary)
                }
            }
        }
        return albumResultsDictionary
    }
}
