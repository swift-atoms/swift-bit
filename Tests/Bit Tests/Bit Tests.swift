import Testing

@testable import Bit

extension Bit {
    @Suite
    enum Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}

extension Bit.Test.Unit {
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
