//
//  AlbumDetailParser.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 22/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AlbumDetailParser {
    let results = "results"
    let track = "track"

    func getAlbumDetailsWithData(_ data: Data) -> [DetailTrackResult] {
        let dict = convertDataToDict(data)
        let tracksResultDictionary = removeAlbumsFromDictionary(dict)
        let onlyTracksData = convertDictToData(tracksResultDictionary)
        do {
            let tracksResult = try JSONDecoder().decode(AlbumDataResult.self, from: onlyTracksData)
            return tracksResult.results
        } catch {
            fatalError("Could not parse")
        }
    }

    // MARK: - Private

    private func convertDataToDict(_ data: Data) -> [String: Any] {
        do {
            guard let dictionary = try JSONSerialization.jsonObject(
                with: data, options: []) as? [String: Any] else {
                    fatalError("Dictionary is not as [String: Any]")
            }
            return dictionary
        } catch {
            fatalError("Сould not convert from Data to Dictionary")
        }
    }

    private func removeAlbumsFromDictionary(_ dictionary: [String: Any]) -> [String: Any] {
        guard let items = dictionary[results] as? [Any] else {
            fatalError("Items is not [Any]")
        }
        var newDictionary = dictionary
        let newItems = items.filter { (item) -> Bool in
            guard let item = item as? [String: Any] else {
                fatalError("Item is not as [String: Any]")
            }
            return item["wrapperType"] as? String == track
        }
        newDictionary[results] = newItems
        return newDictionary
    }

    private func convertDictToData(_ dictionary: [String: Any]) -> Data {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary,
                                                      options: .prettyPrinted)
            return jsonData
        } catch {
            fatalError("Сould not convert from Dictionary to Data")
        }
    }
}
