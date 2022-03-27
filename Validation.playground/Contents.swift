import Validation

let greaterThan10 = Predicate<Int> {
  $0 > 10
}

let v1 = Predicate(\String.isEmpty)
  .pipe(Predicate<String> { $0 != "Bob" })

//dump(v1.validate("Bob"))
let isEmpty = Predicate(\String.isEmpty)
let isBob = Predicate { $0 == "Bob" }

dump(
  Validators.Many(
    [
      isEmpty,
      isBob
    ]
  )
  .validate("Beb")
)

//dump(
//  Pipe(
//    Predicate(\String.isEmpty),
//    Predicate { $0 == "Bob" }
//  )
//  .validate("Bob")
//)

struct User {
  let id: Int
  let name: String
}

let userValidator = Zip2(
  Always<Int>(),
  Predicate(\String.isEmpty)
)
  .map(User.init)
  .eraseToAnyValidator()

let user = userValidator.validate((10, "Aa"))

