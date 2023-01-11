//
//  String+Extension.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 02.01.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
