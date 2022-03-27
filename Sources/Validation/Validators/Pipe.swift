extension Validators {
  public struct Pipe<Upstream, Downstream>: Validator
  where Upstream: Validator,
        Downstream: Validator,
        Upstream.Valid == Downstream.Input {
    public typealias Input = Upstream.Input
    public typealias Valid = Downstream.Valid
    
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
  public func pipe<V: Validator>(_ validator: V) -> Validators.Pipe<Self, V> {
    .init(self, validator)
  }
}
