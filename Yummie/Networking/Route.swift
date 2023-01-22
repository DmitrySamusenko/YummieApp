//
//  Route.swift
//  Yummie
//
//  Created by Dmitry Samusenko on 22.01.2023.
//

import Foundation

enum Route {
    static let baseUrl = "http://yummie.glitch.me"
    case temp
    var description: String {
        switch self {
        case .temp: return "/temp"
            
        }
        
    }
}
