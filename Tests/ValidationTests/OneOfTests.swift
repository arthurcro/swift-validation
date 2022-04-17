import XCTest

@testable import Validation

final class OneOfTests: XCTestCase {
  func testOneOf_Valid() {
    let predicate1 = Predicate<String> { $0.contains("a") }
    let predicate2 = Predicate<String> { $0.count >= 2 }
    let oneOf = OneOf {
      predicate1
      predicate2
    }
    assertValid(oneOf.validate("ab")) {
      XCTAssertEqual($0, "ab")
    }
    assertValid(oneOf.validate("a")) {
      XCTAssertEqual($0, "a")
    }
    assertValid(oneOf.validate("bc")) {
      XCTAssertEqual($0, "bc")
    }
  }

  func testOneOf_Invalid() {
    let predicate1 = Predicate("ab")
    let predicate2 = Predicate<String> { $0.count >= 3 }
    let oneOf = OneOf {
      predicate1
      predicate2
    }
    assertInvalid(oneOf.validate("ef")) {
      XCTAssertEqual($0.count, 2)
    }
  }
}
