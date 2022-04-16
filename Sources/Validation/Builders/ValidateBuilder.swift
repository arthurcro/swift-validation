@resultBuilder public enum ValidateBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }
  
  public static func buildBlock<V1, V2>(
    _ v1: V1,
    _ v2: V2
  )  -> Validators.And<V1, V2>
  where V1: Validator,
        V2: Validator,
        V1.Input == V2.Input,
        V1.Valid == V2.Valid
  {
    .init(v1, v2)
  }
  
  public static func buildBlock<V1, V2, V3>(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3
  )  -> Validators.And<V1, Validators.And<V2, V3>>
  where V1: Validator,
        V2: Validator,
        V3: Validator,
        V1.Input == V2.Input,
        V1.Valid == V2.Valid
  {
    .init(v1, .init(v2, v3))
  }
  
  public static func buildBlock<V1, V2, V3, V4>(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3,
    _ v4: V4
  )  -> Validators.And<V1, Validators.And<V2, Validators.And<V3, V4>>>
  where V1: Validator,
        V2: Validator,
        V3: Validator,
        V4: Validator,
        V1.Input == V2.Input,
        V1.Valid == V2.Valid
  {
    .init(v1, .init(v2, .init(v3, v4)))
  }
}
