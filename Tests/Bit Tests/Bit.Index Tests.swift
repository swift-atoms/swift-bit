import Affine
import Bit
import Byte
import Index
import Ordinal
import Tagged
import Testing

@Suite
struct `Bit.Index Tests` {
    @Suite struct Unit {}
}

extension `Bit.Index Tests`.Unit {
    @Suite struct Typealias {}
    @Suite struct Ratio {}
    @Suite struct `Byte Conversion` {}
}

extension `Bit.Index Tests`.Unit.Typealias {
    @Test
    func `Bit.Index is Index of Bit`() {
        let index: Bit.Index = .init(_unchecked: Ordinal(5 as UInt))
        #expect(index.underlying == Ordinal(5 as UInt))
    }
}

extension `Bit.Index Tests`.Unit.Ratio {
    @Test
    func `bitsPerByte is 8`() {
        let ratio: Affine.Discrete.Ratio<Byte, Bit> = .bitsPerByte
        #expect(ratio.factor == 8)
    }

    @Test
    func `bitsPerWord is UInt.bitWidth`() {
        let ratio: Affine.Discrete.Ratio<UInt, Bit> = .bitsPerWord
        #expect(ratio.factor == UInt.bitWidth)
    }

    @Test
    func `bitWidth for UInt32 is 32`() {
        let ratio: Affine.Discrete.Ratio<UInt32, Bit> = .bitWidth
        #expect(ratio.factor == 32)
    }

    @Test
    func `bitWidth for UInt64 is 64`() {
        let ratio: Affine.Discrete.Ratio<UInt64, Bit> = .bitWidth
        #expect(ratio.factor == 64)
    }
}

extension `Bit.Index Tests`.Unit.`Byte Conversion` {
    @Test
    func `byte 0 maps to bit 0`() {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(0 as UInt))
        let bitIndex = Bit.Index(byteIndex)
        #expect(bitIndex.underlying == Ordinal(0 as UInt))
    }

    @Test
    func `byte 1 maps to bit 8`() {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(1 as UInt))
        let bitIndex = Bit.Index(byteIndex)
        #expect(bitIndex.underlying == Ordinal(8 as UInt))
    }

    @Test
    func `byte 3 maps to bit 24`() {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(3 as UInt))
        let bitIndex = Bit.Index(byteIndex)
        #expect(bitIndex.underlying == Ordinal(24 as UInt))
    }

    @Test
    func `byte 2 with bit offset 5 maps to bit 21`() throws(Ordinal.Error) {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(2 as UInt))
        let offset: Affine.Discrete.Vector = .init(5)
        let bitIndex: Bit.Index = try .init(byteIndex, offset: offset)
        #expect(bitIndex.underlying == Ordinal(21 as UInt))
    }

    @Test
    func `byte 0 with bit offset 0 maps to bit 0`() throws(Ordinal.Error) {
        let bitIndex = try Bit.Index(.init(_unchecked: Ordinal(0 as UInt)), offset: .init(0))
        #expect(bitIndex.underlying == Ordinal(0 as UInt))
    }

    @Test
    func `negative offset below zero underflows`() {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(0 as UInt))
        #expect(throws: Ordinal.Error.underflow) {
            try Bit.Index(byteIndex, offset: .init(-1))
        }
    }

    @Test
    func `negative offset within range retreats`() throws(Ordinal.Error) {
        let byteIndex: Index<Byte> = .init(_unchecked: Ordinal(2 as UInt))
        let bitIndex = try Bit.Index(byteIndex, offset: .init(-3))
        #expect(bitIndex.underlying == Ordinal(13 as UInt))
    }
}
