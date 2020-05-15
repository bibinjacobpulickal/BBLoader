//
//  Helpers.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 15/05/20.
//

import UIKit

extension UIColor {

    static var random: UIColor {
        UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
extension String {

    var camelCaseToWords: String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                if $0.count > 0 {
                    return ($0 + " " + String($1))
                }
            }
            return $0 + String($1)
        }
    }
}
