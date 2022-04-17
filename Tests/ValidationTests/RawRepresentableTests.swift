import XCTest

@testable import Validation

final class RawRepresentableTests: XCTestCase {
  enum Enum: String {
    case a, b, c
  }

  func testRawRepresentable_Valid() {
    let rawRepresentable = Enum.validator()
    assertValid(rawRepresentable.validate("a")) {
      XCTAssertTrue($0 ~= .a)
    }
  }

  func testRawRepresentable_Invalid() {
    let rawRepresentable = Enum.validator()
    assertInvalid(rawRepresentable.validate("d")) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
