import XCTest

@testable import Validation

final class MapTests: XCTestCase {
  struct Container {
    var value: String
  }

  func testMap_Valid() {
    let map = Predicate("abcd").map(Container.init)
    assertValid(map.validate("abcd")) {
      XCTAssertEqual("abcd", $0.value)
    }
  }

  func testMap_Invalid() {
    let map = Predicate("abcd").map(Container.init)
    assertInvalid(map.validate("dcba")) {
      XCTAssertEqual($0.count, 1)
    }
  }
}
