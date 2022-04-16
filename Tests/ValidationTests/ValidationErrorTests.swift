import XCTest
@testable import Validation

final class ValidationErrorTests: XCTestCase {
  func testMessage() {
    let error = ValidationError("Something went wrong.")
    XCTAssertEqual(error.description, "Something went wrong.")
  }
}
