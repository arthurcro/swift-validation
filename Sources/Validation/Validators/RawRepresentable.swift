import Foundation

extension Validators {
  public struct RawRepresentableValidator<Wrapped>: Validator
  where Wrapped: RawRepresentable {
    public func validate(
      _ input: Wrapped.RawValue
    ) -> Validated<Wrapped> {
      if let `case` = Wrapped(rawValue: input) {
        return .valid(`case`)
      }
      return .invalid([.init(description: "\"\(input)\" does not match any case of \(Wrapped.self)")])
    }
  }
}

extension RawRepresentable {
  public static func validator() -> Validators.RawRepresentableValidator<Self> {
    .init()
  }
}
