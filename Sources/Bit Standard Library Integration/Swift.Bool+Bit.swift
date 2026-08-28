public import Bit

extension Bool {

    public init(_ bit: Bit) {
        self = bit == .one
    }
}
