//
//  BBRotatingAnimatingCubesHelpers.swift
//
//  Copyright © 2020 Bibin Jacob Pulickal (https://github.com/bibinjacobpulickal)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension CALayer {

    func rotationAnimation(angles: [CGFloat], duration: Double) {
        let rotationAnimation             = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.duration        = duration
        rotationAnimation.timingFunction  = CAMediaTimingFunction(name: .linear)
        rotationAnimation.repeatCount     = .infinity
        rotationAnimation.values          = angles
        rotationAnimation.keyTimes        = [0, 0.25, 0.5, 0.75, 1]
        rotationAnimation.timingFunctions = [
            CAMediaTimingFunction(name: .linear),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeInEaseOut)
        ]
        add(rotationAnimation, forKey: "transform.rotation.z")
    }
}

extension CAShapeLayer {

    func animateCorners(duration: Double) {
        let animation            = CABasicAnimation(keyPath: "cornerRadius")
        animation.duration       = duration
        animation.toValue        = 0.0
        animation.fromValue      = bounds.midY
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode       = .forwards
        animation.repeatCount    = .infinity
        animation.autoreverses   = true
        add(animation, forKey: "cornerRadius")
    }

    func animatePosition(point: CGPoint, duration: Double) {
        let animation            = CABasicAnimation(keyPath: "position")
        animation.fromValue      = position
        animation.toValue        = point
        animation.duration       = duration
        animation.repeatCount    = .infinity
        animation.autoreverses   = true
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        add(animation, forKey: "position")
    }
}
