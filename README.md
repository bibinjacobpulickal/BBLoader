# BBLoader

Make awesome minimal loading animation with text using BBLoader. BBLoader is a light-weight minimal looking loading animation popup build on top of UIKit for iOS and tvOS. This also, disables user interaction while the contents are being loaded asynchronously. Package is compiled using Xcode 11.0 on MacOS 10.15 using Swift 5.2.2 compiler.

---

## Support
![Platform](https://img.shields.io/badge/Platform-iOS%20|%20tvOS-blue.svg?style=flat)
[![iOS](https://img.shields.io/badge/iOS-8.0+-green.svg?style=flat)](https://www.apple.com/in/macos/catalina/)
[![Xcode](https://img.shields.io/badge/XCode-11.4-blue.svg)](https://developer.apple.com/xcode/)
[![Swift](https://img.shields.io/badge/Swift-5.2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)

---
## Code

```swift
import UIKit
import BBLoader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        presentLoader(setup: { loader in
            loader.title                 = "Loading"
            loader.message               = "Please wait..."
            loader.backgroundColor       = .black
            loader.textColor             = .red
            loader.loadingIndicatorColor = .red
        })
    }
}
```
---
## Working Example

<table>
  <tr>
    <td>Animation</td>
     <td>Dark mode</td>
     <td>Light mode</td>
  </tr>
  <tr>
    <td><img src="Screenshots/BBLoader.gif" width=300 height=600></td>
    <td><img src="Screenshots/BBLoaderDark.png" width=300 height=600></td>
    <td><img src="Screenshots/BBLoaderLight.png" width=300 height=600></td>
  </tr>
 </table>

 ---
 ## Installation

 ### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms.

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/bibinjacobpulickal/BBLoader.git", .upToNextMajor(from: "1.0.0"))
]
```

---
## License

BBLoader is released under the MIT license. [See LICENSE](https://github.com/bibinjacobpulickal/BBLoader/blob/master/LICENSE) for details.
