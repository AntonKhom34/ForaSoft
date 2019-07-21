//
//  AlbumDetailServies.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 20/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumDetailServies {
    let urlItunce = "https://itunes.apple.com/lookup?id="
    let urlEntity = "&entity=song"
}

// MARK: - AlbumDetailServiesProtocol

extension AlbumDetailServies: AlbumDetailServiesProtocol {
    func getAlbumDetail(_ colletionId: Int, onComplete: @escaping ([DetailAlbumResult]) -> Void) {
        URLSession.shared.dataTask(with: getURLWithCollectionID(colletionId)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(AlbumDataResult.self, from: data)
                let albumInfo = self.getAlbumInfo(dataResult.results)
                onComplete(albumInfo)
            } catch {
                onComplete([])
            }
            }.resume()
    }

    // MARK: - Private

    private func getURLWithCollectionID(_ collectionID: Int) -> URL {
        let urlString = urlItunce + "\(collectionID)" + urlEntity
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }

    private func getAlbumInfo(_ detailAlbumResult: [DetailAlbumResult]) -> [DetailAlbumResult] {
        var trakInfo: [DetailAlbumResult] = []

        for result in detailAlbumResult where result.wrapperType == "track" {
            trakInfo.append(result)
        }
        return trakInfo
    }
}
