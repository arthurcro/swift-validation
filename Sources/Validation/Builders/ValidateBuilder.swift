@resultBuilder public enum ValidateBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }
  
  public static func buildArray<V: Validator>(
    _ components: [V]
  ) -> Validators.Many<V> {
    .init(components)
  }
  
  public static func buildBlock<V: Validator>(
    _ components: V...
  ) -> Validators.Many<V> {
    .init(components)
  }
}
