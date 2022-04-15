import Validation

enum Mine: String {
  case b
}

ValidateThrough {
  Predicate<String> { $0 == "a" }
}

