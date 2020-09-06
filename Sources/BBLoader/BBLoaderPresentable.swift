import UIKit
import BBAlert

extension BBAlertPresentable {

    public func presentBBLoader(duration: Double = 0,
                                setup: ((BBLoader) -> Void)? = nil,
                                completion: ((BBLoader) -> Void)? = nil) {

        let loader = BBLoader(title: "Loading",
                              message: "Please wait...")
        setup?(loader)

        present(loader) {
            completion?(loader)

            self.handleDismissal(loader,
                                 after: duration)
        }
    }

    private func handleDismissal(_ loader: BBLoader,
                                 after duration: Double) -> Void {

        if !duration.isZero {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                loader.dismiss()
            }
        }
    }
}
