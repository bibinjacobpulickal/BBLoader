//
//  AnimatedLoaderViewController.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 13/09/20.
//

import UIKit
import BBLoader

class AnimatedLoaderViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "BBLoader"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(presentAnimatedLoader))
    }

    @objc func presentAnimatedLoader() {
        presentBBAnimatedLoader(type: .quadRotatingSquaresToCircles, setup: { loader in
            guard let loader = loader as? BBQuadRotatingSquaresToCircles else { return }
            loader.animationCycleDuration = 0.5
            loader.sizeWidthMultiplier    = 0.4
            loader.animatingColor         = #colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1)
            loader.animatingColors        = ((#colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1), #colorLiteral(red: 0.9374079108, green: 0.7400206923, blue: 1, alpha: 1)), (#colorLiteral(red: 0.6756847501, green: 0.7432909608, blue: 0.9375373721, alpha: 1), #colorLiteral(red: 0.9669341445, green: 0.646687448, blue: 0.7728756666, alpha: 1)))
            loader.startAngle             = .zero
            loader.endAngle               = .pi/2
        })
    }
}
