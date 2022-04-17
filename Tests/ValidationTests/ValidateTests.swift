import XCTest

@testable import Validation

final class ValidateTests: XCTestCase {
  func testValidate_Valid() {
    let predicate1 = Predicate<String> { $0.contains("a") }
    let predicate2 = Predicate<String> { $0.count == 5 }
    let validate = Validate {
      predicate1
      predicate2
    }
    assertValid(validate.validate("abcde")) {
      XCTAssertEqual($0, "abcde")
    }
  }

  func testValidate_Invalid() {
    let predicate1 = Predicate<String> { $0.contains("a") }
    let predicate2 = Predicate<String> { $0.count == 5 }
    let validate = Validate {
      predicate1
      predicate2
    }
    assertInvalid(validate.validate("abc")) {
      XCTAssertEqual($0.count, 1)
    }
    assertInvalid(validate.validate("bcdef")) {
      XCTAssertEqual($0.count, 1)
    }
    assertInvalid(validate.validate("bcd")) {
      XCTAssertEqual($0.count, 2)
    }
  }
}
