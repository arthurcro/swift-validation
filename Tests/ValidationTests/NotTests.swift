import XCTest

@testable import Validation

final class NotTests: XCTestCase {
  func testNot_Valid() {
    let not = Not(Predicate("abcd"))
    assertValid(not.validate("dcba")) {
      XCTAssertEqual("dcba", $0)
    }
  }

  func testNot_Invalid() {
    let not = Not(Predicate("abcd"))
    assertInvalid(not.validate("abcd")) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
