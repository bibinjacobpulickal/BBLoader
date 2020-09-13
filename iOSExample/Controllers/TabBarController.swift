//
//  TabBarController.swift
//  iOSExample
//
//  Created by Bibin Jacob Pulickal on 13/09/20.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = UINavigationController(rootViewController: AnimatedLoaderViewController())
        firstViewController.tabBarItem.title = "Animated"
        firstViewController.tabBarItem.image = UIImage(systemName: "timelapse")

        let secondViewController = UINavigationController(rootViewController: ViewController())
        secondViewController.tabBarItem.title = "Basic"
        secondViewController.tabBarItem.image = UIImage(systemName: "rays")

        viewControllers = [
            firstViewController,
            secondViewController
        ]
    }
}
