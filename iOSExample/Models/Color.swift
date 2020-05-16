//
//  Color.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 15/05/20.
//

import UIKit

enum Color: String, CaseIterable {
    case none, white, black, red, yellow, green, purple, random

    var color: UIColor? {
        switch self {
        case .none: return .none
        case .white: return .white
        case .black: return .black
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        case .purple: return .purple
        case .random: return .random
        }
    }
}
