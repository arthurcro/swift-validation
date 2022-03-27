public enum Validated<Valid> {
  case valid(Valid)
  case invalid([ValidationError])
  
  public var valid: Valid? {
    guard case let .valid(valid) = self
    else { return nil }
    return valid
  }
  
  public var errors: [ValidationError]? {
    guard case let .invalid(errors) = self
    else { return nil }
    return errors
  }
}

extension Validated {
  public func map<NewValid>(
    _ transform: (Valid) -> NewValid
  ) -> Validated<NewValid> {
    switch self {
    case let .valid(valid):
      return .valid(transform(valid))
    case let .invalid(errors):
      return .invalid(errors)
    }
  }
  
  public func flatMap<NewValid>(
    _ transform: (Valid) -> Validated<NewValid>
  ) -> Validated<NewValid> {
    switch self {
    case let .valid(valid):
      return transform(valid)
    case let .invalid(errors):
      return .invalid(errors)
    }
  }
  
  public static func zip2<V1, V2>(
    _ v1: Validated<V1>,
    _ v2: Validated<V2>
  ) -> Validated<(V1, V2)>  {
    switch (v1, v2) {
    case let (.valid(valid1), .valid(valid2)):
      return .valid((valid1, valid2))
    case let (.valid, .invalid(errors)):
      return .invalid(errors)
    case let (.invalid(errors), .valid):
      return .invalid(errors)
    case let (.invalid(errors1), .invalid(errors2)):
      return .invalid(errors1 + errors2)
    }
  }
  
  public static func zip3<V1, V2, V3>(
    _ v1: Validated<V1>,
    _ v2: Validated<V2>,
    _ v3: Validated<V3>
  ) -> Validated<(V1, V2, V3)>  {
    .zip2(.zip2(v1, v2), v3)
      .map { ($0.0, $0.1, $1) } 
  }
}
