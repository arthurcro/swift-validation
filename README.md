# swift-validation

An experimental library for validating just about anything.

## Motivation

Inspired by [swift-parsing](https://github.com/pointfreeco/swift-parsing), this library provides a declarative and composable way of validating any type of input into a `Validated` struct.
This library is not meant to be used in production code yet. It is an exercise to learn more about Swift type system and result builders.   

## Getting started

### Validated

The library exposes a `Validated` type and some helpers to accumulate validation errors. 

```swift
enum Validated<Valid> {
 case valid(Valid)
 case invalid(ValidationError)
}
```

### Validator

A `Validator` is defined by `Input` associated type representing the type to be validated. A `Valid` associated type representing the possibly transform validated `Input`. Finally, a `validate` function to validate an `Input` into a `Validated<Valid>`. 

```swift
public protocol Validator {
  associatedtype Input
  associatedtype Valid
  
  func validate(_ input: Input) -> Validated<Valid>
}
```

### Usage

The most common way of creating a `Validator` is through the various builders.

The `Validate` validator, is an entry point for the `ValidateBuilder` which validate an input by running it again various `Validator`s of the matching `Input` and `Valid` associated value. 

```swift
Validate {
  Predicate<String> {  }
}

```

## Playground

The library comes with a playground that you can run to experiment with the different validators.
