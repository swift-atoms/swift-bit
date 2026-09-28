@frozen
public enum Bit: Swift.Sendable {

    case zero

    case one
}

extension Bit: Swift.Equatable {}

extension Bit: Swift.Hashable {}
