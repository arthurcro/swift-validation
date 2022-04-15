public struct Predicate<Input>: Validator {
  private let predicate: (Input) -> Bool
  private let context: (StaticString, UInt)
  
  public init(
    _ predicate: @escaping (Input) -> Bool,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    self.context = (file, line)
    self.predicate = predicate
  }
  
  public init(
    _ input: Input,
    file: StaticString = #file,
    line: UInt = #line
  ) where Input: Equatable {
    self.context = (file, line)
    self.predicate = { $0 == input }
  }
  
  public func validate(
    _ input: Input
  ) -> Validated<Input> {
    if self.predicate(input) { return .valid(input) }
    let errorDescription = """
    Predicate at (file: \(context.0), line: \(context.1)) on "\(input)" failed.
    """
    return .invalid([.init(errorDescription)])
  }
}
