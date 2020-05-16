import UIKit

public protocol BBLoaderPresentable {

    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)?)
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

extension UIViewController: BBLoaderPresentable { }

extension BBLoaderPresentable {

    public func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)?) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }
}

extension BBLoaderPresentable {

    public func presentLoader(setup: ((BBLoader) -> Void)? = nil, completion: ((BBLoader) -> Void)? = nil) {

        let loader = BBLoader(title: "Loading", message: "Please wait...")

        setup?(loader)
        present(loader) {
            completion?(loader)
        }
    }
}
