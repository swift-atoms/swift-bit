extension Bit {

    @inlinable
    public static func adding(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs ^ rhs
    }

    @inlinable
    public func adding(_ other: Bit) -> Bit {
        Self.adding(self, other)
    }

    @inlinable
    public static func multiplying(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs & rhs
    }

    @inlinable
    public func multiplying(_ other: Bit) -> Bit {
        Self.multiplying(self, other)
    }
}
