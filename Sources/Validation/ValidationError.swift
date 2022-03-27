import Foundation

public struct ValidationError: Error {
  public var description: String
  
  public init(
    description: String
  ) {
    self.description = description
  }
}
