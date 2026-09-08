import Bit
import Hash
import Testing

@Suite
struct `Bit Hash Tests` {

    @Test
    func `Bit supplies a domain-typed hash through Hash Protocol`() {
        func hash<T: Hash::Hash.`Protocol`>(_ value: borrowing T) -> Hash::Hash.Value {
            value.hashValue
        }

        let first: Hash::Hash.Value = hash(Bit::Bit.zero)
        let second: Hash::Hash.Value = hash(Bit::Bit.zero)
        #expect(first == second)
    }
}
