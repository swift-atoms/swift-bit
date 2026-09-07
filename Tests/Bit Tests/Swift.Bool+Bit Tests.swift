import Bit
import Testing

@Suite
struct `Boolean and bit values convert in both directions` {

    @Test
    func `Bool initializes from Bit`() {
        #expect(Bool(Bit.one))
        #expect(!Bool(Bit.zero))
    }

    @Test
    func `Bit initializes from Bool`() {
        #expect(Bit(true) == .one)
        #expect(Bit(false) == .zero)
    }

    @Test
    func `conversion round-trips in both directions`() {
        for bit in Bit.allCases {
            #expect(Bit(Bool(bit)) == bit)
        }
        for bool in [false, true] {
            #expect(Bool(Bit(bool)) == bool)
        }
    }
}
