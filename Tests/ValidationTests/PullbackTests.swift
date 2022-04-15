import XCTest
@testable import Validation

final class PullbackTests: XCTestCase {
  func testPullback_Valid() {
    let pullback = Predicate(5).pullback(\String.count)
    assertValid(pullback.validate("abcde")) {
      XCTAssertEqual("abcde", $0)
    }
  }
  
  func testPullback_Invalid() {
    let pullback = Predicate(5).pullback(\String.count)
    assertInvalid(pullback.validate("abc")) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
