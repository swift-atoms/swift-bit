extension Bit {

    @inlinable
    public static func ^ (lhs: Bit, rhs: Bit) -> Bit {

        Bit(rawValue: lhs.rawValue ^ rhs.rawValue)!
    }

    @inlinable
    public static func & (lhs: Bit, rhs: Bit) -> Bit {

        Bit(rawValue: lhs.rawValue & rhs.rawValue)!
    }

    @inlinable
    public static func | (lhs: Bit, rhs: Bit) -> Bit {

        Bit(rawValue: lhs.rawValue | rhs.rawValue)!
    }

    @inlinable
    public static prefix func ~ (value: Bit) -> Bit {

        Bit(rawValue: value.rawValue ^ 1)!
    }
}
