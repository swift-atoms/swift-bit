public import Bit

extension Bit {

    @inlinable
    public init(_ bool: Bool) {
        self = bool ? .one : .zero
    }
}

extension Bit: ExpressibleByBooleanLiteral {

    @inlinable
    public init(booleanLiteral value: Bool) {
        self = value ? .one : .zero
    }
}

extension Bool {

    public init(
        _ bit: Bit
    ) {
        self = bit == .one
    }
}
