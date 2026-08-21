extension FixedWidthInteger {

    @inlinable
    public static func rotateLeft(_ value: Self, by count: Int) -> Self {
        let width = Self.bitWidth

        let shift = ((count % width) + width) % width
        guard shift != 0 else { return value }

        let bits = Magnitude(truncatingIfNeeded: value)
        let rotated = (bits << shift) | (bits >> (width - shift))
        return Self(truncatingIfNeeded: rotated)
    }

    @inlinable
    public func rotateLeft(by count: Int) -> Self {
        Self.rotateLeft(self, by: count)
    }

    @inlinable
    public static func rotateRight(_ value: Self, by count: Int) -> Self {
        let width = Self.bitWidth

        let shift = ((count % width) + width) % width
        guard shift != 0 else { return value }

        let bits = Magnitude(truncatingIfNeeded: value)
        let rotated = (bits >> shift) | (bits << (width - shift))
        return Self(truncatingIfNeeded: rotated)
    }

    @inlinable
    public func rotateRight(by count: Int) -> Self {
        Self.rotateRight(self, by: count)
    }

    @inlinable
    public static func reverseBits(_ value: Self) -> Self {
        var result: Self = 0
        var workingValue = value

        for _ in 0..<Self.bitWidth {
            result <<= 1
            result |= workingValue & 1
            workingValue >>= 1
        }

        return result
    }

    @inlinable
    public func reverseBits() -> Self {
        Self.reverseBits(self)
    }
}
