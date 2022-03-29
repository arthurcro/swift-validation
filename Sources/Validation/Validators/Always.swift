extension Validators {
  public struct Always<Input>: Validator {
    public init() {}
    
    public func validate(_ input: Input) -> Validated<Input> {
      .valid(input)
    }
  }
}
