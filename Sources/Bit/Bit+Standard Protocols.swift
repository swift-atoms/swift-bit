extension Bit: CaseIterable {

    public static let allCases: [Bit] = [.zero, .one]
}

extension Bit: Comparable {

    @inlinable
    public static func < (lhs: Bit, rhs: Bit) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Bit: CustomStringConvertible {

    public var description: String {
        switch self {
        case .zero: "0"
        case .one: "1"
        }
    }
}

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

extension Bit: ExpressibleByIntegerLiteral {

    @inlinable
    public init(integerLiteral value: UInt8) {
        precondition(value <= 1, "Bit literal must be 0 or 1")
        self = value == 0 ? .zero : .one
    }
}

extension Bit {

    @inlinable
    public init(normalizing value: UInt8) {
        self = value == 0 ? .zero : .one
    }

    @inlinable
    public static func ^ (lhs: Bit, rhs: UInt8) -> Bit {
        Bit(normalizing: lhs.rawValue ^ (rhs & 1))
    }
}

#if !hasFeature(Embedded)
    extension Bit: Codable {}
#endif
