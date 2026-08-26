import Bit_Primitive

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
