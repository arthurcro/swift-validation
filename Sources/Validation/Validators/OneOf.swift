public struct OneOf<V: Validator>: Validator {
  private let validator: V
  
  public init(
    @OneOfBuilder _ builder: () -> V
  ) {
    self.validator = builder()
  }
  
  public func validate(
    _ input: V.Input
  ) -> Validated<V.Valid> {
    validator.validate(input)
  }
}
