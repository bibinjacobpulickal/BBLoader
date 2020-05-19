import UIKit

public extension BBLoader {

    var loadingIndicatorStyle: UIActivityIndicatorView.Style {
        set {
            BBLoader.loadingIndicator.style = newValue
        }
        get {
            BBLoader.loadingIndicator.style
        }
    }

    var loadingIndicatorColor: UIColor? {
        set {
            guard let loadingIndicatorColor = newValue else { return }
            BBLoader.loadingIndicator.color = loadingIndicatorColor
        }
        get {
            BBLoader.loadingIndicator.color
        }
    }

    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}
