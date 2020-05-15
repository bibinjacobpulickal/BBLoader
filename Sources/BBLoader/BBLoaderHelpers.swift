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

    var textColor: UIColor {
        set {
            titleTextColor   = newValue
            messageTextColor = newValue
        }
        get {
            titleTextColor
        }
    }

    var titleTextColor: UIColor {
        set {
            let attributedTitle = NSAttributedString(string: title ?? "", attributes: [.foregroundColor: newValue])
            setValue(attributedTitle, forKey: "attributedTitle")
        }
        get {
            let attributedTitle = value(forKey: "attributedTitle") as? NSAttributedString
            var color = UIColor.clear
            for (key, value) in attributedTitle?.attributes(at: 0, effectiveRange: nil) ?? [:] {
                if key == .foregroundColor, let value = value as? UIColor {
                    color = value
                }
            }
            return color
        }
    }

    var messageTextColor: UIColor {
        set {
            let attributedMessage = NSAttributedString(string: message ?? "", attributes: [.foregroundColor: newValue])
            setValue(attributedMessage, forKey: "attributedMessage")
        }
        get {
            let attributedMessage = value(forKey: "attributedMessage") as? NSAttributedString
            var color = UIColor.clear
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

    var loadingIndicatorColor: UIColor {
        set {
            loadingIndicator.color = newValue
        }
        get {
            loadingIndicator.color
        }
    }

    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}
