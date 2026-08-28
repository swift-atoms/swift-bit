@frozen
public enum Bit: UInt8, Sendable, Hashable, Equatable {

    case zero = 0

    case one = 1

    @inlinable
    public init?(_ value: UInt8) {
        self.init(rawValue: value)
    }
}
