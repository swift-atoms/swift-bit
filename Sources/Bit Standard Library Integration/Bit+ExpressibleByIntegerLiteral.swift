extension Bit: ExpressibleByIntegerLiteral {

    @inlinable
    public init(integerLiteral value: UInt8) {
        precondition(value <= 1, "Bit literal must be 0 or 1")
        self = value == 0 ? .zero : .one
    }
}
