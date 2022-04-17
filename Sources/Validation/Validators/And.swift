extension Validators {
  public struct And<V1, V2>: Validator
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
      case let (.invalid(errors), .valid):
        return .invalid(errors)
      case let (.valid, .valid(valid)):
        return .valid(valid)
      case let (.valid, .invalid(errors)):
        return .invalid(errors)
      case let (.invalid(errors1), .invalid(errors2)):
        return .invalid(errors1 + errors2)
      }
    }
  }
}
