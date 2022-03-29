extension Validators {
  public struct Many<V>: Validator
  where V: Validator {
    private let validator: V
    
    public init(_ validator: V) {
      self.validator = validator
    }
    
    public func validate(
      _ input: [V.Input]
    ) -> Validated<[V.Valid]> {
     fatalError()
    }
  }
}
