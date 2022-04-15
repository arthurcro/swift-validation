import Foundation

public struct ValidationError: Error {
  public var message: String
  
  public init(
    _ message: String
  ) {
    self.message = message
  }
}

extension ValidationError: CustomStringConvertible {
  public var description: String { message }
}
