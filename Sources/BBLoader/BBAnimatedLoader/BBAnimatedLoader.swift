//
//  BBAnimatedLoader.swift
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

public class BBAnimatedLoader: UIViewController {

    public var loadable: BBAnimatable

    init(type: BBAnimationType) {

        switch type {
        case .quadRotatingSquaresToCircles:
            loadable = BBQuadRotatingSquaresToCircles()
        case .multicolorSpinner:
            loadable = BBMulticolorSpinnerView()
        case .default:
            loadable = UIActivityIndicatorView(style: .whiteLarge)
        }
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setupAnimatingViewConstraints()
        loadable.startAnimating()
    }

    private func setupAnimatingViewConstraints() {
        guard let animatingView = loadable as? UIView else { return }
        view.addSubview(animatingView)
        animatingView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            animatingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
