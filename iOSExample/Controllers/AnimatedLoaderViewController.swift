//
//  AnimatedLoaderViewController.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 13/09/20.
//

import UIKit
import BBLoader
import BBHelperKit

class AnimatedLoaderViewController: UITableViewController {

    private var selectedAnimationType = AnimationType.default

    override func loadView() {
        super.loadView()

        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "BBLoader"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(presentAnimatedLoader))
    }

    @objc func presentAnimatedLoader() {
        presentBBAnimatedLoader(type: selectedAnimationType.type, duration: 8, setup: { loader in
            if let loader = loader as? UIActivityIndicatorView {
                loader.color = .red
            } else if let loader = loader as? BBQuadRotatingSquaresToCircles {
                loader.animationCycleDuration = 0.5
                loader.sizeWidthMultiplier    = 0.4
                loader.animatingColor         = #colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1)
                loader.animatingColors        = ((#colorLiteral(red: 0.5502940416, green: 0.8689419627, blue: 0.9688422084, alpha: 1), #colorLiteral(red: 0.9374079108, green: 0.7400206923, blue: 1, alpha: 1)), (#colorLiteral(red: 0.6756847501, green: 0.7432909608, blue: 0.9375373721, alpha: 1), #colorLiteral(red: 0.9669341445, green: 0.646687448, blue: 0.7728756666, alpha: 1)))
                loader.startAngle             = .zero
                loader.endAngle               = .pi/2
            } else if let loader = loader as? BBMulticolorSpinnerView {
                loader.sizeWidthMultiplier = 0.4
                loader.lineWidth           = 4
            }
        })
    }
}

extension AnimatedLoaderViewController {

    enum AnimationType: String, CaseIterable {
        case `default`
        case multicolorSpinner
        case quadRotatingSquaresToCircles

        var type: BBAnimationType {
            switch self {
            case .default:
                return .default
            case .multicolorSpinner:
                return .multicolorSpinner
            case .quadRotatingSquaresToCircles:
                return .quadRotatingSquaresToCircles
            }
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Animation Type"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnimationType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(UITableViewCell.self, for: indexPath) { cell in
            let type = AnimationType.allCases[indexPath.row]
            cell.textLabel?.text = type.rawValue.camelCaseToWords.capitalizeFirstLetter
            cell.accessoryType = AnimationType.allCases[indexPath.row] == self.selectedAnimationType ? .checkmark : .none
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnimationType = AnimationType.allCases[indexPath.row]
        tableView.reloadData()
    }
}
