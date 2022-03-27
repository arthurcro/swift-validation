public protocol Validator {
  /// The type of value to be validated
  associatedtype Input
  /// The type of value validated
  associatedtype Valid
  
  /// Attempt to validate an input
  /// - Parameter input: The input to validate
  /// - Returns: A validated value if valid or an array of errors
  func validate(_ input: Input) -> Validated<Valid>
}
