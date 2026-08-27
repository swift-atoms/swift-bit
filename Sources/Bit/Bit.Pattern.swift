extension Bit {

    public enum Pattern<Carrier: FixedWidthInteger & UnsignedInteger & Sendable> {}
}

extension Bit.Pattern.Mask {

    @inlinable
    public static var zero: Self { Self(0) }

    @inlinable
    public static var allOnes: Self { Self(~0) }
}

extension Bit.Pattern.Mask {

    @inlinable
    public static func lowBits(_ n: Int) -> Self {
        precondition(n >= 0, "n must be non-negative")
        if n == 0 { return Self(0) }
        if n >= Carrier.bitWidth { return Self(~0) }
        return Self((Carrier(1) &<< n) &- 1)
    }

    @inlinable
    public static func highBits(_ n: Int) -> Self {
        precondition(n >= 0, "n must be non-negative")
        if n == 0 { return Self(0) }
        if n >= Carrier.bitWidth { return Self(~0) }
        return Self(~((Carrier(1) &<< (Carrier.bitWidth - n)) &- 1))
    }

    @inlinable
    public static func bit(_ position: Int) -> Self {
        precondition(position >= 0 && position < Carrier.bitWidth, "Bit position out of bounds")
        return Self(Carrier(1) &<< position)
    }
}

extension Bit.Pattern.Mask {

    @inlinable
    public static func & (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying & rhs.underlying)
    }

    @inlinable
    public static func | (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying | rhs.underlying)
    }

    @inlinable
    public static func ^ (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying ^ rhs.underlying)
    }

    @inlinable
    public static prefix func ~ (mask: Self) -> Self {
        Self(~mask.underlying)
    }
}

extension Bit.Pattern.Mask {

    @inlinable
    public func contains(_ other: Self) -> Bool {
        (underlying & other.underlying) == other.underlying
    }

    @inlinable
    public func intersects(_ other: Self) -> Bool {
        (underlying & other.underlying) != 0
    }

    @inlinable
    public var popcount: Int {
        underlying.nonzeroBitCount
    }

    @inlinable
    public var isEmpty: Bool {
        underlying == 0
    }
}

extension Bit.Pattern.Mask: CustomStringConvertible {

    public var description: String {
        "0x" + String(underlying, radix: 16, uppercase: true)
    }
}

public typealias Pattern8 = Bit.Pattern<UInt8>

public typealias Pattern16 = Bit.Pattern<UInt16>

public typealias Pattern32 = Bit.Pattern<UInt32>

public typealias Pattern64 = Bit.Pattern<UInt64>

public typealias PatternWord = Bit.Pattern<UInt>
