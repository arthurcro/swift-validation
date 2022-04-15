import XCTest
@testable import Validation

final class PredicateTests: XCTestCase {
  func testPredicate_Valid() {
    let predicate = Predicate<String> { $0.count == 10 }
    assertValid(predicate.validate("abcdefghij")) {
      XCTAssertEqual("abcdefghij", $0)
    }
  }
  
  func testPredicate_Invalid() {
    let predicate = Predicate<String> { $0.count == 10 }
    assertInvalid(predicate.validate("abcd")) { errors in
      XCTAssertEqual(errors.count, 1)
    }
  }
  func testPredicate_Equatable() {
    let predicate = Predicate("abcd")
    assertValid(predicate.validate("abcd")) {
      XCTAssertEqual("abcd", $0)
    }
  }
}
