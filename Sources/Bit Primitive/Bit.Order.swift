extension Bit {

    public enum Order: Sendable, Hashable {

        case msb

        case lsb
    }
}

extension Bit.Order {

    @inlinable
    public static var `most significant bit first`: Self { .msb }

    @inlinable
    public static var `least significant bit first`: Self { .lsb }
}

extension Bit.Order {

    @inlinable
    public static func opposite(_ order: Bit.Order) -> Bit.Order {
        switch order {
        case .msb: return .lsb
        case .lsb: return .msb
        }
    }

    @inlinable
    public var opposite: Bit.Order {
        Self.opposite(self)
    }

    @inlinable
    public static prefix func ! (value: Bit.Order) -> Bit.Order {
        opposite(value)
    }
}
