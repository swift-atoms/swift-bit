public import Bit

extension Bit.Pattern {

    public struct Mask: Sendable, Equatable, Hashable {

        public let underlying: Carrier

        @inlinable
        public init(_ underlying: Carrier) {
            self.underlying = underlying
        }
    }
}
