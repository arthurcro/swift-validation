public struct Not<Upstream>: Validator
where
  Upstream: Validator,
  Upstream.Input == Upstream.Valid
{
  private let upstream: Upstream

  public init(
    _ upstream: Upstream
  ) {
    self.upstream = upstream
  }

  public func validate(
    _ input: Upstream.Input
  ) -> Validated<Upstream.Valid> {
    guard case .invalid = upstream.validate(input)
    else {
      let errorDescription = """
        Expected validation with \(Upstream.self) on "\(input)" to fail but succeeded.
        """
      return .invalid([.init(errorDescription)])
    }

    return .valid(input)
  }
}
