@resultBuilder public enum ValidateBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }
  
  public static func buildArray<V: Validator>(
    _ validators: [V]
  ) -> some Validator {
    Validators.All(validators)
  }
  
  public static func buildBlock<V: Validator>(
    _ validators: V...
  ) -> some Validator {
    Validators.All(validators)
  }
}
