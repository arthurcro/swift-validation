public struct Zip2<V1, V2>: Validator
where V1: Validator, V2: Validator {
  private let v1: V1
  private let v2: V2

  public init(
    _ v1: V1,
    _ v2: V2
  ) {
    self.v1 = v1
    self.v2 = v2
  }

  public func validate(
    _ input: (V1.Input, V2.Input)
  ) -> Validated<(V1.Valid, V2.Valid)> {
    .zip2(
      v1.validate(input.0),
      v2.validate(input.1)
    )
  }
}

public struct Zip3<V1, V2, V3>: Validator
where
  V1: Validator,
  V2: Validator,
  V3: Validator
{
  private let v1: V1
  private let v2: V2
  private let v3: V3

  public init(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3
  ) {
    self.v1 = v1
    self.v2 = v2
    self.v3 = v3
  }

  public func validate(
    _ input: (V1.Input, V2.Input, V3.Input)
  ) -> Validated<(V1.Valid, V2.Valid, V3.Valid)> {
    .zip3(
      v1.validate(input.0),
      v2.validate(input.1),
      v3.validate(input.2)
    )
  }
}

public struct Zip4<V1, V2, V3, V4>: Validator
where
  V1: Validator,
  V2: Validator,
  V3: Validator,
  V4: Validator
{
  private let v1: V1
  private let v2: V2
  private let v3: V3
  private let v4: V4

  public init(
    _ v1: V1,
    _ v2: V2,
    _ v3: V3,
    _ v4: V4
  ) {
    self.v1 = v1
    self.v2 = v2
    self.v3 = v3
    self.v4 = v4
  }

  public func validate(
    _ input: (V1.Input, V2.Input, V3.Input, V4.Input)
  ) -> Validated<(V1.Valid, V2.Valid, V3.Valid, V4.Valid)> {
    .zip3(
      v1.validate(input.0),
      v2.validate(input.1),
      .zip2(v3.validate(input.2), v4.validate(input.3))
    )
    .map {
      ($0.0, $0.1, $0.2.0, $0.2.1)
    }
  }
}
