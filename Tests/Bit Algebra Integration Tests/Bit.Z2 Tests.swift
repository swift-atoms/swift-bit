#if Algebra
import Algebra
import Bit
import Testing

@Suite struct `Bit.Z2 Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Bit.Z2 Tests`.Unit {
    @Test
    func `additive identity is zero`() {
        #expect(Bit.z2.zero == .zero)
    }

    @Test
    func `multiplicative identity is one`() {
        #expect(Bit.z2.one == .one)
    }

    @Test
    func `addition is XOR`() {
        let field = Bit.z2
        #expect(field.adding(.zero, .zero) == .zero)
        #expect(field.adding(.zero, .one) == .one)
        #expect(field.adding(.one, .zero) == .one)
        #expect(field.adding(.one, .one) == .zero)
    }

    @Test
    func `multiplication is AND`() {
        let field = Bit.z2
        #expect(field.multiplying(.zero, .zero) == .zero)
        #expect(field.multiplying(.zero, .one) == .zero)
        #expect(field.multiplying(.one, .zero) == .zero)
        #expect(field.multiplying(.one, .one) == .one)
    }

    @Test
    func `every element is its own additive inverse`() {
        let field = Bit.z2
        #expect(field.negating(.zero) == .zero)
        #expect(field.negating(.one) == .one)
    }

    @Test
    func `one is its own reciprocal`() throws {
        #expect(try Bit.z2.reciprocal(.one) == .one)
    }

    @Test
    func `zero is non-invertible`() {
        #expect(throws: Algebra.Field<Bit>.Error.self) {
            _ = try Bit.z2.reciprocal(.zero)
        }
    }
}

#endif
