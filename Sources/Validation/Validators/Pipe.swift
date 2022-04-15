extension Validators {
  public struct Pipe2<Upstream, Downstream>: Validator
  where Upstream: Validator,
        Downstream: Validator,
        Upstream.Valid == Downstream.Input
  {
    private let upstream: Upstream
    private let downstream: Downstream
    
    public init(
      _ upstream: Upstream,
      _ downstream: Downstream
    ) {
      self.upstream = upstream
      self.downstream = downstream
    }
    
    public func validate(
      _ input: Upstream.Input
    ) -> Validated<Downstream.Valid> {
      self.upstream.validate(input).flatMap(self.downstream.validate(_:))
    }
  }
}

extension Validator {
  public func pipe<V: Validator>(_ validator: V) -> Validators.Pipe2<Self, V> {
    .init(self, validator)
  }
}
