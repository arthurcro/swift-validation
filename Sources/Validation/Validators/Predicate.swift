public struct Predicate<Input>: Validator {
  private let predicate: (Input) -> Bool
  private let context: (String, Int)
  
  public init(
    _ predicate: @escaping (Input) -> Bool,
    file: String = #file,
    line: Int = #line
  ) {
    self.context = (file, line)
    self.predicate = predicate
  }
  
  public func validate(
    _ input: Input
  ) -> Validated<Input> {
    if self.predicate(input) { return .valid(input) }
    let errorDescription = """
    Predicate at (file: \(context.0), line: \(context.1)) on "\(input)" failed.
    """
    return .invalid([.init(description: errorDescription)])
  }
}
