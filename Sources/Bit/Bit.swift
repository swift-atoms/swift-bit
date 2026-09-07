@frozen
public enum Bit {

    case zero

    case one
}

extension Bit: Swift.Equatable {}

extension Bit: Swift.Hashable {}
