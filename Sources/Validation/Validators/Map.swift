extension Validators {
  public struct Map<Upstream, Input, Valid>: Validator
  where
    Upstream: Validator,
    Upstream.Input == Input
  {
    private let transform: (Upstream.Valid) -> Valid
    private let upstream: Upstream

    public init(
      upstream: Upstream,
      _ transform: @escaping (Upstream.Valid) -> Valid
    ) {
      self.upstream = upstream
      self.transform = transform
    }

    public func validate(
      _ input: Input
    ) -> Validated<Valid> {
      self.upstream.validate(input).map(transform)
    }
  }
}

extension Validator {
  public func map<Validated>(
    _ transform: @escaping (Self.Valid) -> Validated
  ) -> Validators.Map<Self, Self.Input, Validated> {
    .init(upstream: self, transform)
  }
}
