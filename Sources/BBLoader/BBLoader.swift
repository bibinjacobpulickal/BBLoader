import UIKit

public class BBLoader: UIAlertController {

    let loadingIndicator = UIActivityIndicatorView()

    convenience init(title: String = "", message: String = "") {
        self.init(title: title, message: message, preferredStyle: .alert)

        setupLoadingIndicator()
    }

    private func setupLoadingIndicator() {
        if #available(iOS 13.0, tvOS 13.0, *) {
            loadingIndicator.style            = .large
        } else {
            loadingIndicator.style            = .whiteLarge
        }

        loadingIndicator.startAnimating()
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                loadingIndicator.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 24),
                loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        } else {
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: loadingIndicator, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 24),
                NSLayoutConstraint(item: loadingIndicator, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)])
        }
    }
}
