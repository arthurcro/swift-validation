public struct Zip2<Upstream1, Upstream2>: Validator
where Upstream1: Validator, Upstream2: Validator {
  private let upstream1: Upstream1
  private let upstream2: Upstream2
  
  public init(
    _ upstream1: Upstream1,
    _ upstream2: Upstream2
  ) {
    self.upstream1 = upstream1
    self.upstream2 = upstream2
  }
  
  public func validate(
    _ input: (Upstream1.Input, Upstream2.Input)
  ) -> Validated<(Upstream1.Valid, Upstream2.Valid)> {
    .zip2(
      upstream1.validate(input.0),
      upstream2.validate(input.1)
    )
  }
}

public struct Zip3<Upstream1, Upstream2, Upstream3>: Validator
where Upstream1: Validator, Upstream2: Validator, Upstream3: Validator {
  private let upstream1: Upstream1
  private let upstream2: Upstream2
  private let upstream3: Upstream3
  
  public init(
    _ upstream1: Upstream1,
    _ upstream2: Upstream2,
    _ upstream3: Upstream3
  ) {
    self.upstream1 = upstream1
    self.upstream2 = upstream2
    self.upstream3 = upstream3
  }
  
  public func validate(
    _ input: (Upstream1.Input, Upstream2.Input, Upstream3.Input)
  ) -> Validated<(Upstream1.Valid, Upstream2.Valid, Upstream3.Valid)> {
    .zip3(
      upstream1.validate(input.0),
      upstream2.validate(input.1),
      upstream3.validate(input.2)
    )
  }
}
