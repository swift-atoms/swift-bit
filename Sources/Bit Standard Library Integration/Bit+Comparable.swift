public import Bit

extension Bit: Swift.Comparable {

    @inlinable
    public static func < (lhs: Bit, rhs: Bit) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
