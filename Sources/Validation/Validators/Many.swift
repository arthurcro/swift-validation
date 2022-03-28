extension Validators {
  public struct Many<V: Validator>: Validator {
    private let validators: [V]
    
    public init(
      _ validators: [V]
    ) {
      self.validators = validators
    }
    
    public func validate(
      _ input: V.Input
    ) -> Validated<V.Valid> {
      guard let firstValidator = self.validators.first
      else {
        let emptyErrorDescription = """
        \(Many.self) expects at least one \(V.self) but none were provided.
        """
        return .invalid([.init(description: emptyErrorDescription)])
      }
      
      var validated = firstValidator.validate(input)
      
      for validator in validators.suffix(from: 1) {
        switch (validated, validator.validate(input)) {
        case let (.invalid(errors), .valid):
          validated = .invalid(errors)
        case let (.valid, .valid(valid)):
          validated = .valid(valid)
        case let (.valid, .invalid(errors)):
          validated = .invalid(errors)
        case let (.invalid(errors1), .invalid(errors2)):
          validated = .invalid(errors1 + errors2)
        }
      }
      return validated
    }
  }
}
