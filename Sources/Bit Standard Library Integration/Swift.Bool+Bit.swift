public import Bit

extension Bool {

    @inlinable
    public init(_ bit: Bit) {
        self = bit == .one
    }
}

extension Bit {

    @inlinable
    public init(_ bool: Bool) {
        self = bool ? .one : .zero
    }
}
