//
//  ApiServies.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class ApiServies {
    private let apiUrl = "https://itunes.apple.com/search?term="
    private let entityAndLimitString = "&entity=album&limit="
}

// MARK: - ApiServiesProtocol

extension ApiServies: ApiServiesProtocol {
    func getAlbumsWithSearchString(_ searchString: String,
                                   _ albumsCount: Int,
                                   onComplete: @escaping ([DataAlbumResult]) -> Void) {
        URLSession.shared.dataTask(with: getUrlWithSearchBar(searchString, albumsCount)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(DataAlbumsResult.self, from: data)
                onComplete(dataResult.results)
            } catch {
                onComplete([])
            }
        }.resume()
    }

    // MARK: - Private

    private func getUrlWithSearchBar(_ searchString: String, _ albumsCount: Int) -> URL {
        let urlString = apiUrl + "\(searchString)" + entityAndLimitString + "\(albumsCount)"
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }
}
