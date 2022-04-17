import XCTest

@testable import Validation

final class ZipTests: XCTestCase {
  func testZip2_Valid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let zip = Zip2(predicateString, predicateInt)
    assertValid(zip.validate(("ab", 10))) {
      XCTAssertEqual($0.0, "ab")
      XCTAssertEqual($0.1, 10)
    }
  }

  func testZip2_Invalid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let zip = Zip2(predicateString, predicateInt)
    assertInvalid(zip.validate(("a", 1))) {
      XCTAssertEqual($0.count, 2)
    }
  }

  func testZip3_Valid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let predicateBool = Predicate(true)
    let zip = Zip3(predicateString, predicateInt, predicateBool)
    assertValid(zip.validate(("ab", 10, true))) {
      XCTAssertEqual($0.0, "ab")
      XCTAssertEqual($0.1, 10)
      XCTAssertEqual($0.2, true)
    }
  }

  func testZip3_Invalid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let predicateBool = Predicate(true)
    let zip = Zip3(predicateString, predicateInt, predicateBool)
    assertInvalid(zip.validate(("a", 1, false))) {
      XCTAssertEqual($0.count, 3)
    }
  }

  func testZip4_Valid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let predicateBool = Predicate(true)
    let predicateDouble = Predicate(10.5)
    let zip = Zip4(predicateString, predicateInt, predicateBool, predicateDouble)
    assertValid(zip.validate(("ab", 10, true, 10.5))) {
      XCTAssertEqual($0.0, "ab")
      XCTAssertEqual($0.1, 10)
      XCTAssertEqual($0.2, true)
      XCTAssertEqual($0.3, 10.5)
    }
  }

  func testZip4_Invalid() {
    let predicateString = Predicate("ab")
    let predicateInt = Predicate(10)
    let predicateBool = Predicate(true)
    let predicateDouble = Predicate(10.5)
    let zip = Zip4(predicateString, predicateInt, predicateBool, predicateDouble)
    assertInvalid(zip.validate(("a", 1, false, 9.5))) {
      XCTAssertEqual($0.count, 4)
    }
  }
}
