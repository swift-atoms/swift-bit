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
}
