@resultBuilder public enum ValidateThroughBuilder {
  public static func buildBlock<V: Validator>(
    _ validator: V
  ) -> V {
    validator
  }

  public static func buildBlock<V1, V2>(
    _ v1: V1,
    _ v2: V2
  ) -> Validators.Pipe2<V1, V2>
  where
    V1: Validator,
    V2: Validator,
    V2.Input == V1.Valid
  {
    v1.pipe(v2)
  }

  public static func buildBlock<V1, V2, V3>(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3
  )
    -> Validators.Pipe2<
      Validators.Pipe2<V1, V2>, V3
    >
  where
    V1: Validator,
    V2: Validator,
    V3: Validator,
    V2.Input == V1.Valid,
    V3.Input == V2.Valid
  {
    v1.pipe(v2).pipe(v3)
  }

  public static func buildBlock<V1, V2, V3, V4>(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3,
    _ v4: V4
  )
    -> Validators.Pipe2<
      Validators.Pipe2<
        Validators.Pipe2<V1, V2>,
        V3
      >,
      V4
    >
  where
    V1: Validator,
    V2: Validator,
    V3: Validator,
    V4: Validator,
    V2.Input == V1.Valid,
    V3.Input == V2.Valid,
    V4.Input == V3.Valid
  {
    v1.pipe(v2).pipe(v3).pipe(v4)
  }

  public static func buildBlock<V1, V2, V3, V4, V5>(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3,
    _ v4: V4,
    _ v5: V5
  )
    -> Validators.Pipe2<
      Validators.Pipe2<
        Validators.Pipe2<
          Validators.Pipe2<V1, V2>,
          V3
        >,
        V4
      >,
      V5
    >
  where
    V1: Validator,
    V2: Validator,
    V3: Validator,
    V4: Validator,
    V5: Validator,
    V2.Input == V1.Valid,
    V3.Input == V2.Valid,
    V4.Input == V3.Valid,
    V5.Input == V4.Valid
  {
    v1.pipe(v2).pipe(v3).pipe(v4).pipe(v5)
  }
}
