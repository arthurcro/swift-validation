public struct Not<Upstream>: Validator
where Upstream: Validator,
      Upstream.Input == Upstream.Valid {
  public typealias Input = Upstream.Input
  public typealias Valid = Upstream.Valid
  
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
      return .invalid([.init(description: errorDescription)])
    }
    
    return .valid(input)
  }
}
