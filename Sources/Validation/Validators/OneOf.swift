public struct OneOf<V>: Validator where V: Validator
{
  private let validators: [V]
  
  public init(_ validators: V...) {
    self.validators = validators
  }
  
  public func validate(
    _ input: V.Input
  ) -> Validated<V.Valid> {
    var validationErrors: [ValidationError] = []
    for validator in validators {
      switch validator.validate(input) {
      case let .valid(valid):
        return .valid(valid)
      case let .invalid(errors):
        validationErrors.append(contentsOf: errors)
      }
    }
    return .invalid(validationErrors)
  }
}

