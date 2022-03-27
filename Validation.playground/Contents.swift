import Validation

struct User {
  var age: Int
  var id: String
  var name: String
}

let idValidator = Not(Predicate(\String.isEmpty))
let ageValidator = Predicate { $0 > 10 }
let nameValidator = ageValidator.pullback(\String.count)

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
