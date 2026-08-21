extension Bit {

    @inlinable
    public static func nand(_ lhs: Bit, _ rhs: Bit) -> Bit {
        ~(lhs & rhs)
    }

    @inlinable
    public func nand(_ other: Bit) -> Bit {
        Self.nand(self, other)
    }
}

extension Bit {

    @inlinable
    public static func nor(_ lhs: Bit, _ rhs: Bit) -> Bit {
        ~(lhs | rhs)
    }

    @inlinable
    public func nor(_ other: Bit) -> Bit {
        Self.nor(self, other)
    }
}

extension Bit {

    @inlinable
    public static func xnor(_ lhs: Bit, _ rhs: Bit) -> Bit {
        ~(lhs ^ rhs)
    }

    @inlinable
    public func xnor(_ other: Bit) -> Bit {
        Self.xnor(self, other)
    }
}

extension Bit {

    @inlinable
    public static func andNot(_ lhs: Bit, _ rhs: Bit) -> Bit {
        lhs & ~rhs
    }

    @inlinable
    public func andNot(_ other: Bit) -> Bit {
        Self.andNot(self, other)
    }
}
