// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "swift-validation",
  products: [
    .library(
      name: "Validation",
      targets: ["Validation"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Validation",
      dependencies: []
    ),
    .testTarget(
      name: "ValidationTests",
      dependencies: ["Validation"]
    ),
  ]
)
