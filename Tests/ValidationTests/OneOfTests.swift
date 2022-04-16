import XCTest
@testable import Validation

final class OneOfTests: XCTestCase {
  func testOneOf_Valid() {
    let predicate1 = Predicate("ab")
    let predicate2 = Predicate("cd")
    let oneOf = OneOf {
      predicate1
      predicate2
    }
    assertValid(oneOf.validate("ab")) {
      XCTAssertEqual($0, "ab")
    }
    assertValid(oneOf.validate("cd")) {
      XCTAssertEqual($0, "cd")
    }
  }
  
  func testOneOf_Invalid() {
    let predicate1 = Predicate("ab")
    let predicate2 = Predicate("cd")
    let oneOf = OneOf {
      predicate1
      predicate2
    }
    assertInvalid(oneOf.validate("ef")) {
      XCTAssertEqual($0.count, 2)
    }
  }
}
