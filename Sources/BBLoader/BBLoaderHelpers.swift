import UIKit

public extension BBLoader {

    var backgroundColor: UIColor? {
        set {
            view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = newValue
        }
        get {
            view.subviews.first?.subviews.first?.subviews.first?.backgroundColor
        }
    }

    var textColor: UIColor? {
        set {
            titleTextColor   = newValue
            messageTextColor = newValue
        }
        get {
            titleTextColor
        }
    }

    var titleTextColor: UIColor? {
        set {
            guard let foregroundColor = newValue else { return }
            let attributedTitle = NSAttributedString(string: title ?? "", attributes: [.foregroundColor: foregroundColor])
            setValue(attributedTitle, forKey: "attributedTitle")
        }
        get {
            let attributedTitle = value(forKey: "attributedTitle") as? NSAttributedString
            var color: UIColor?
            for (key, value) in attributedTitle?.attributes(at: 0, effectiveRange: nil) ?? [:] {
                if key == .foregroundColor, let value = value as? UIColor {
                    color = value
                }
            }
            return color
        }
    }

    var messageTextColor: UIColor? {
        set {
            guard let foregroundColor = newValue else { return }
            let attributedMessage = NSAttributedString(string: message ?? "", attributes: [.foregroundColor: foregroundColor])
            setValue(attributedMessage, forKey: "attributedMessage")
        }
        get {
            let attributedMessage = value(forKey: "attributedMessage") as? NSAttributedString
            var color: UIColor?
            for (key, value) in attributedMessage?.attributes(at: 0, effectiveRange: nil) ?? [:] {
                if key == .foregroundColor, let value = value as? UIColor {
                    color = value
                }
            }
            return color
        }
    }

    var loadingIndicatorStyle: UIActivityIndicatorView.Style {
        set {
            loadingIndicator.style = newValue
        }
        get {
            loadingIndicator.style
        }
    }

    var loadingIndicatorColor: UIColor? {
        set {
            guard let loadingIndicatorColor = newValue else { return }
            loadingIndicator.color = loadingIndicatorColor
        }
        get {
            loadingIndicator.color
        }
    }

    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}
