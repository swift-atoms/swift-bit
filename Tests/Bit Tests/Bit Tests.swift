import Testing

@testable import Bit

extension Bit {
    @Suite
    enum `Bits preserve binary values and compact storage` {
        @Suite struct `Bit layout equality and iteration preserve both cases` {}
        @Suite struct `No additional bit edge cases are defined` {}
        @Suite struct `No additional bit integration cases are defined` {}
        @Suite(.serialized) struct `No bit performance cases are defined` {}
    }
}

extension Bit.`Bits preserve binary values and compact storage`.`Bit layout equality and iteration preserve both cases` {
    @Test
    func `memory layout is exactly one byte`() {
        #expect(MemoryLayout<Bit>.size == 1)
        #expect(MemoryLayout<Bit>.stride == 1)
    }

    @Test
    func `cases are distinct`() {
        #expect(Bit.zero != .one)
    }

    @Test
    func `equal cases hash equally`() {
        #expect(Set<Bit>([.zero, .one, .zero, .one]).count == 2)
    }

    @Test
    func `case iteration is complete`() {
        #expect(Bit.allCases == [.zero, .one])
    }
}
