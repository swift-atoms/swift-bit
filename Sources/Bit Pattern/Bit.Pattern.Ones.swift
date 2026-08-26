extension Bit.Pattern {

    public struct Ones: Sendable {
        @usableFromInline
        let word: Carrier

        @inlinable
        public init(_ word: Carrier) {
            self.word = word
        }
    }
}

extension Bit.Pattern.Ones {

    @inlinable
    public var first: Int? {
        word == 0 ? nil : word.trailingZeroBitCount
    }

    @inlinable
    public var last: Int? {
        word == 0 ? nil : Carrier.bitWidth - 1 - word.leadingZeroBitCount
    }
}

extension Bit.Pattern.Ones {

    @inlinable
    public func rank(below position: Int) -> Int {
        guard position > 0 else { return 0 }
        guard position < Carrier.bitWidth else { return word.nonzeroBitCount }
        let mask = Bit.Pattern<Carrier>.Mask.lowBits(position).underlying
        return (word & mask).nonzeroBitCount
    }
}

extension Bit.Pattern.Ones {

    @inlinable
    public func select(_ n: Int) -> Int? {
        guard n >= 0 else { return nil }
        var remaining = n
        var w = word
        while w != 0 {
            if remaining == 0 { return w.trailingZeroBitCount }
            w &= w &- 1
            remaining &-= 1
        }
        return nil
    }
}

extension Bit.Pattern.Ones {

    @inlinable
    public func forEach(_ body: (Int) -> Void) {
        var w = word
        while w != 0 {
            body(w.trailingZeroBitCount)
            w &= w &- 1
        }
    }
}
