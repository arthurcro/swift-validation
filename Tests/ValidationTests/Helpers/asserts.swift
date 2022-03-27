import XCTest
import Validation

func assertValid<Valid>(
  _ validated: Validated<Valid>,
  _ file: StaticString = #filePath,
  _ line: UInt = #line,
  _ onValid: (Valid) -> Void
) {
  guard case let .valid(valid) = validated
  else {
    return XCTFail(
      "Expected \(validated.self) to be valid but wasn't.",
      file: file,
      line: line
    )
  }
  onValid(valid)
}

func assertInvalid<Valid>(
  _ validated: Validated<Valid>,
  _ file: StaticString = #filePath,
  _ line: UInt = #line,
  _ onInvalid: ([ValidationError]) -> Void
) {
  guard case let .invalid(errors) = validated
  else {
    return XCTFail(
      "Expected \(validated.self) to be invalid but wasn't.",
      file: file,
      line: line
    )
  }
  onInvalid(errors)
}
