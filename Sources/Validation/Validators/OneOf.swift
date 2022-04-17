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

extension Validators {
  public struct OneOf2<V1, V2>: Validator
  where
    V1: Validator,
    V2: Validator,
    V1.Input == V2.Input,
    V1.Valid == V2.Valid
  {
    private let v1: V1
    private let v2: V2

    public init(
      _ v1: V1,
      _ v2: V2
    ) {
      self.v1 = v1
      self.v2 = v2
    }

    public func validate(
      _ input: V1.Input
    ) -> Validated<V1.Valid> {
      switch (v1.validate(input), v2.validate(input)) {
      case let (.invalid, .valid(valid)):
        return .valid(valid)
      case let (.valid(valid), .invalid):
        return .valid(valid)
      case let (.valid, .valid(valid)):
        return .valid(valid)
      case let (.invalid(e1), .invalid(e2)):
        return .invalid(e1 + e2)
      }
    }
  }
}
