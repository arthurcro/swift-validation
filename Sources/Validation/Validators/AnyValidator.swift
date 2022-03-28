public struct AnyValidator<Input, Valid>: Validator {
  private let validator: (Input) -> Validated<Valid>
  
  public init<V: Validator>(
    _ validator: V
  ) where V.Input == Input, V.Valid == Valid {
    self.validator = validator.validate
  }
  
  public func validate(_ input: Input) -> Validated<Valid> {
    self.validator(input)
  }
}

extension Validator {
  public func eraseToAnyValidator() -> AnyValidator<Input, Valid> {
    .init(self)
  }
}
