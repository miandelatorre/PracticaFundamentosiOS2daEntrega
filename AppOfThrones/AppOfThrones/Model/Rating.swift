//
//  Rating.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating:  CustomStringConvertible, Equatable {
        
    var id: Int
    var rate: Rate
    
    var description: String {
        
        switch rate {
            case .rated(let value):
                 return "id: \(id), rate: \(value)"
            case .unrated:
                return "id: \(id), unrated"
        }
    }
    
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        lhs.id == rhs.id
    }
}
