//
//  BBLoaderPresentable.swift
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

public extension UIViewController {

    func presentBBLoader(duration: Double                   = 0,
                         setup: ((BBLoader) -> Void)?       = nil,
                         completion: ((BBLoader) -> Void)?  = nil) {

        let loader = BBLoader(title: "Loading",
                              message: "Please wait...")
        setup?(loader)

        present(loader, animated: true) {
            completion?(loader)
            self.handleDismissal(loader, after: duration)
        }
    }

    func presentBBAnimatedLoader(type: BBAnimationType            = .default,
                                 duration: Double                 = 0,
                                 setup: ((BBAnimatable) -> Void)? = nil,
                                 completion: (() -> Void)?        = nil) {

        let animatedLoader = BBAnimatedLoader(type: type)
        setup?(animatedLoader.loadable)

        present(animatedLoader, animated: true) {
            completion?()
            self.handleDismissal(animatedLoader, after: duration)
        }
    }

    private func handleDismissal(_ loader: UIViewController,
                                 after duration: Double) -> Void {
        if !duration.isZero {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                loader.dismiss(animated: true)
            }
        }
    }
}
