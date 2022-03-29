import XCTest
@testable import Validation

final class AlwaysTests: XCTestCase {
  func testAlways() {
    let alwaysString = Validators.Always<String>()
    let alwaysInt = Validators.Always<Int>()
    
    assertValid(alwaysString.validate("Bob")) {
      XCTAssertEqual($0, "Bob")
    }
    
    assertValid(alwaysInt.validate(100)) {
      XCTAssertEqual($0, 100)
    }
  }
}
