extension Bit.Pattern {

    public struct Zeros: Sendable {
        @usableFromInline
        let word: Carrier

        @inlinable
        public init(_ word: Carrier) {
            self.word = word
        }
    }
}

extension Bit.Pattern.Zeros {

    @inlinable
    public var first: Int? {
        Bit.Pattern<Carrier>.Ones(~word).first
    }

    @inlinable
    public var last: Int? {
        Bit.Pattern<Carrier>.Ones(~word).last
    }
}

extension Bit.Pattern.Zeros {

    @inlinable
    public func rank(below position: Int) -> Int {
        guard position > 0 else { return 0 }
        let bound = Swift.min(position, Carrier.bitWidth)
        return bound - Bit.Pattern<Carrier>.Ones(word).rank(below: bound)
    }
}

extension Bit.Pattern.Zeros {

    @inlinable
    public func select(_ n: Int) -> Int? {
        Bit.Pattern<Carrier>.Ones(~word).select(n)
    }
}

extension Bit.Pattern.Zeros {

    @inlinable
    public func forEach(_ body: (Int) -> Void) {
        Bit.Pattern<Carrier>.Ones(~word).forEach(body)
    }
}
