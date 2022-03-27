public struct Always<Input>: Validator {
  public typealias Valid = Input
  
  public init() {}
  
  public func validate(_ input: Input) -> Validated<Input> {
    .valid(input)
  }
}
