import Validation

struct User {
  var age: Int
  var id: String
  var name: String
}

let idValidator = Not(Predicate(\String.isEmpty)).eraseToAnyValidator()
let ageValidator = Predicate { $0 > 10 }.eraseToAnyValidator()
let nameValidator = ageValidator.pullback(\String.count).eraseToAnyValidator()

let userValidator = Zip3(ageValidator, idValidator, nameValidator).map(User.init)

dump(userValidator.eraseToAnyValidator().self)

let age = 15
let id = "myID"
let name = "Arthur"

let validatedUser = userValidator.validate((age, id, name))

switch validatedUser {
  case let .valid(user):
    dump(user)
case let .invalid(errors):
    dump(errors)
}

let b = Validate {
  idValidator
  nameValidator
}

/*
 
 Validate {
  OneOf {
    Predicate<String> { $0 != "Bob" },
    Predicate<String> { $0.count == 10 }
  }
 }.map(...)
 
 */
