import XCTest
@testable import Validation

final class AnyValidatorTests: XCTestCase {
  func testAnyValidator_Valid() {
    let predicate = Predicate("abcd")
    let anyValidator = AnyValidator(predicate)
    assertValid(anyValidator.validate("abcd")) {
      XCTAssertEqual("abcd", $0)
    }
  }
  
  func testAnyValidator_Invalid() {
    let predicate = Predicate("abcd")
    let anyValidator = AnyValidator(predicate)
    assertInvalid(anyValidator.validate("ab")) {
      XCTAssertEqual($0.count, 1)
    }
  }
    
  func testEraseToAnyValidator_Valid() {
    let predicate = Predicate("abcd")
    let anyValidator = predicate.eraseToAnyValidator()
    assertValid(anyValidator.validate("abcd")) {
      XCTAssertEqual("abcd", $0)
    }
  }
  
  func testEraseToAnyValidator_Invalid() {
    let predicate = Predicate("abcd")
    let anyValidator = predicate.eraseToAnyValidator()
    assertInvalid(anyValidator.validate("ab")) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
