//
//  BBQuadRotatingSquaresToCircles.swift
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

public class BBQuadRotatingSquaresToCircles: UIView {

    /// Animation cycle duration.
    public var animationCycleDuration = 1.0

    /// Animating shape size, by default size determined by ratio of width. Defaults to zero.
    public var animationSize = CGSize.zero

    /// Animating shape size is determined with respect the ratio to width of presenting view.
    public var sizeWidthMultiplier: CGFloat = 0.5

    /// Single colour to be used for all the animating shapes.
    public var animatingColor = #colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1) {
        didSet {
            animatingColors = ((animatingColor, animatingColor), (animatingColor, animatingColor))
        }
    }

    /// Multiple colors to be used for the animating shapes.
    public var animatingColors = ((#colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1), #colorLiteral(red: 0.9374079108, green: 0.7400206923, blue: 1, alpha: 1)), (#colorLiteral(red: 0.6756847501, green: 0.7432909608, blue: 0.9375373721, alpha: 1), #colorLiteral(red: 0.9669341445, green: 0.646687448, blue: 0.7728756666, alpha: 1)))

    /// The angle at which the rotation begins.
    public var startAngle = CGFloat.zero

    /// The angle at which the rotation ends.
    public var endAngle = CGFloat.pi

    /// Multiple shapes to be used for the animation.
    private var loaderShapes = [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()]

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {

        loaderShapes.forEach {
            layer.addSublayer($0)
            $0.masksToBounds = true
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        setupShapeFramesAndPath()
        setupShapeColors()
    }

    private func setupShapeFramesAndPath() {
        let side = bounds.width/2 - bounds.width * 0.1
        let size = CGSize(width: side, height: side)

        let loaderShapeFrames = [
            CGRect(origin: .zero, size: size),
            CGRect(origin: CGPoint(x: bounds.width/2 + bounds.width * 0.1, y: 0), size: size),
            CGRect(origin: CGPoint(x: 0, y: bounds.height/2 + bounds.width * 0.1), size: size),
            CGRect(origin: CGPoint(x: bounds.width/2 + bounds.width * 0.1, y: bounds.height/2 + bounds.width * 0.1), size: size)
        ]

        let bezierPath = UIBezierPath(rect: loaderShapeFrames.first!)

        zip(loaderShapeFrames, loaderShapes).forEach {
            $1.cornerRadius = side/2
            $1.path         = bezierPath.cgPath
            $1.frame        = $0
        }
    }

    private func setupShapeColors() {
        zip(loaderShapes, [animatingColors.0.0, animatingColors.0.1, animatingColors.1.0, animatingColors.1.1]).forEach {
            $0.fillColor = $1.cgColor
        }
    }
}

extension BBQuadRotatingSquaresToCircles: BBAnimatable {

    public func startAnimating() {

        guard let superview = superview else { return }
        if animationSize == .zero {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: sizeWidthMultiplier),
                heightAnchor.constraint(equalTo: widthAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: animationSize.width),
                heightAnchor.constraint(equalToConstant: animationSize.height)
            ])
        }

        superview.layoutIfNeeded()

        let side    = bounds.width/2 - bounds.width * 0.1
        let size    = CGSize(width: side, height: side)
        let padding = CGFloat(0.01)

        let loaderShapeBounds = [
            CGRect(origin: CGPoint(x: bounds.midX - side - bounds.width * padding, y: bounds.midY - side - bounds.height * padding), size: size),
            CGRect(origin: CGPoint(x: bounds.midX + bounds.width * padding, y: bounds.midY - side - bounds.height * padding), size: size),
            CGRect(origin: CGPoint(x: bounds.midX - side - bounds.width * padding, y: bounds.midY + bounds.height * padding), size: size),
            CGRect(origin: CGPoint(x: bounds.midX + bounds.width * padding, y: bounds.midY + bounds.height * padding), size: size)
        ]

        zip(loaderShapeBounds, loaderShapes).forEach {
            $1.animateCorners(duration: animationCycleDuration)
            $1.animatePosition(point: CGPoint(x: $0.midX, y: $0.midY), duration: animationCycleDuration)
        }

        layer.rotationAnimation(angles: [startAngle, -endAngle, startAngle, endAngle, startAngle], duration: animationCycleDuration * 4)
    }

    public func stopAnimating() {
        loaderShapes.forEach {
            $0.removeAllAnimations()
        }
        layer.removeAllAnimations()
        removeFromSuperview()
    }
}
