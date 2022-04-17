public struct ValidateThrough<V>: Validator
where V: Validator {
  private let validator: V

  public init(
    @ValidateThroughBuilder _ builder: () -> V
  ) {
    self.validator = builder()
  }

  public func validate(_ input: V.Input) -> Validated<V.Valid> {
    self.validator.validate(input)
  }
}
