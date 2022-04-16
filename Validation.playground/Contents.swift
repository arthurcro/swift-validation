import Validation

struct User {
  let age: Int
  let name: String
  let email: String
}

let userValidator = Zip3(
  Validate {
    Predicate<Int> { $0 >= 16 }
  },
  Validate {
    Predicate<String> { !$0.isEmpty }
    Predicate<String> { $0.count < 10 }
  },
  Validate {
    OneOf {
      Predicate<String> { $0.contains("@") }
      Predicate<String> { $0.isEmpty }
    }
    Predicate("abcd")
  }
)
  .map(User.init)
  .eraseToAnyValidator()

let validatedUser = userValidator.validate((18, "Bob", "bob@gmail.com"))
