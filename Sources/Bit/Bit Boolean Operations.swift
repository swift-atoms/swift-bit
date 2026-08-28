extension Bit {

    @inlinable
    public static func flipped(_ bit: Bit) -> Bit {
        ~bit
    }

    @inlinable
    public var flipped: Bit {
        ~self
    }

    @inlinable
    public static prefix func ! (value: Bit) -> Bit {
        ~value
    }

    @inlinable
    public static func toggled(_ bit: Bit) -> Bit {
        ~bit
    }

    @inlinable
    public var toggled: Bit {
        ~self
    }
}

extension Bit {

    @inlinable
    public static func and(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs & rhs
    }

    @inlinable
    public func and(_ other: Bit) -> Bit {
        self & other
    }

    @inlinable
    public static func or(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs | rhs
    }

    @inlinable
    public func or(_ other: Bit) -> Bit {
        self | other
    }

    @inlinable
    public static func xor(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs ^ rhs
    }

    @inlinable
    public func xor(_ other: Bit) -> Bit {
        self ^ other
    }
}
