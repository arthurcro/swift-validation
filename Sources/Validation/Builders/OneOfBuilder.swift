@resultBuilder public enum OneOfBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }
  
  public static func buildArray<V: Validator>(
    _ validators: [V]
  ) -> Validators.OneOfMany<V> {
    .init(validators)
  }
  
  public static func buildBlock<V: Validator>(
    _ validators: V...
  ) -> Validators.OneOfMany<V> {
    .init(validators)
  }
}
