extension Validators {
  public struct Unwrap<Wrapped>: Validator {
    public func validate(_ input: Wrapped?) -> Validated<Wrapped> {
      if let input = input {
        return .valid(input)
      }
      return .invalid(
        [.init(description: "Expected value of type \(Wrapped.self) but got nil instead.")]
      )
    }
  }
}

extension Optional {
  public static func validator() -> Validators.Unwrap<Wrapped> {
    .init()
  }
}
