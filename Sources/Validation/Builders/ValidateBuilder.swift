@resultBuilder public enum ValidateBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }
  
  public static func buildArray<V: Validator>(
    _ validators: [V]
  ) -> Validators.All<V> {
    .init(validators)
  }
  
  public static func buildBlock<V: Validator>(
    _ validators: V...
  ) -> Validators.All<V> {
    .init(validators)
  }
}
