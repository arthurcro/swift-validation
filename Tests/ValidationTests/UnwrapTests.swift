import XCTest

@testable import Validation

final class UnwrapTests: XCTestCase {
  func testUnwrap_Valid() {
    let unwrap = String?.validator()
    assertValid(unwrap.validate("abcd")) {
      XCTAssertEqual("abcd", $0)
    }
  }

  func testUnwrap_Invalid() {
    let unwrap = String?.validator()
    assertInvalid(unwrap.validate(nil)) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
