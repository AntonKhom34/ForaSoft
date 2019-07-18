//
//  ApiServies.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 18/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class ApiServies {
    private let apiUrl = "https://itunes.apple.com/search?"
    private let entityString = "&entity=album"
}

// MARK: - ApiServiesProtocol

extension ApiServies: ApiServiesProtocol {
    func getAlbumsWithSearchBar(searchBar: String, onComplete: @escaping ([AlbumResult]) -> Void) {
        URLSession.shared.dataTask(with: getUrlWithSearchBar(searchBar)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(AlbumsResult.self, from: data)
                onComplete(dataResult.results)
            } catch {
                onComplete([])
            }
            }.resume()
    }

    // MARK: - Private

    private func getUrlWithSearchBar(_ searchBar: String) -> URL {
        let urlString = apiUrl + "term=\(searchBar)" + entityString
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }
}
