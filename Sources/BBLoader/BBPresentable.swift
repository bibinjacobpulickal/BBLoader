import UIKit

public protocol BBPresentable {

    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)?)
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

extension UIViewController: BBPresentable { }

extension BBPresentable {

    public func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)?) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }
}

extension BBPresentable {

    public func presentLoader(setup: ((BBLoader) -> Void)? = nil, completion: ((BBLoader) -> Void)? = nil) {

        let loader = BBLoader(title: "Loading", message: "Please wait...")

        setup?(loader)
        present(loader) {
            completion?(loader)
        }
    }
}
