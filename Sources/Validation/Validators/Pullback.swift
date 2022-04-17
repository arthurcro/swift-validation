extension Validators {
  public struct Pullback<Downstream, Input>: Validator
  where Downstream: Validator {
    private let downstream: Downstream
    private let transform: (Input) -> Downstream.Input

    public init(
      downstream: Downstream,
      transform: @escaping (Input) -> Downstream.Input
    ) {
      self.downstream = downstream
      self.transform = transform
    }

    public func validate(_ input: Input) -> Validated<Input> {
      self.downstream.validate(self.transform(input)).map { _ in input }
    }
  }
}

extension Validator {
  public func pullback<Input>(
    _ transform: @escaping (Input) -> Self.Input
  ) -> Validators.Pullback<Self, Input> {
    .init(downstream: self, transform: transform)
  }
}
