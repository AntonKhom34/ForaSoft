//
//  StringExtention.swift
//  EvaluationTestiOS
//
//  Created by Антон Хомяков on 24/07/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        let localizebleString = NSLocalizedString(self, comment: "")
        return localizebleString
    }
}
