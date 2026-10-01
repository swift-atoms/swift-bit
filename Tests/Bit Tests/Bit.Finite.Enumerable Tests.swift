#if Finite
import Bit
import Testing

@Suite struct `Bit Finite.Enumerable Tests` {
    @Suite struct Unit {
        @Suite struct `Bit Value` {}
        @Suite struct `Bit Order` {}
    }

    @Suite struct `Edge Case` {}

    @Suite struct Integration {}
}

extension `Bit Finite.Enumerable Tests`.Unit.`Bit Value` {
    @Test
    func `Finite.Enumerable count is 2`() {
        #expect(Bit.count == Cardinal(2))
    }

    @Test
    func `Finite.Enumerable ordinal values`() {
        #expect(Bit.zero.ordinal == Ordinal(0))
        #expect(Bit.one.ordinal == Ordinal(1))
    }

    @Test
    func `Finite.Enumerable init from ordinal unchecked`() {
        #expect(Bit(_unchecked: (), ordinal: Ordinal(0)) == .zero)
        #expect(Bit(_unchecked: (), ordinal: Ordinal(1)) == .one)
    }
}

#endif
