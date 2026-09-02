import Bit
import Bit_Standard_Library_Integration
import Testing

@Suite
struct `Swift.Bool Bit Integration Tests` {

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
