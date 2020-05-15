import XCTest
@testable import BBLoader

final class BBLoaderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BBLoader().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
