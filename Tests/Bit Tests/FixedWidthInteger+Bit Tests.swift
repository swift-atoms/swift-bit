import Testing

@testable import Bit
import Bit_Standard_Library_Integration

@Suite
struct `FixedWidthInteger+Bit Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `FixedWidthInteger+Bit Tests`.Unit {

    @Test
    func `rotateLeft by zero returns original`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateLeft(by: 0) == value)
    }

    @Test(arguments: [
        (0b11010011 as UInt8, 1, 0b10100111 as UInt8),
        (0b11010011 as UInt8, 2, 0b01001111 as UInt8),
        (0b11010011 as UInt8, 4, 0b00111101 as UInt8),
        (0b10000000 as UInt8, 1, 0b00000001 as UInt8),
    ])
    func `rotateLeft shifts bits circularly`(testCase: (UInt8, Int, UInt8)) {
        let (value, count, expected) = testCase
        #expect(value.rotateLeft(by: count) == expected)
    }

    @Test
    func `rotateLeft by bitWidth returns original`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateLeft(by: 8) == value)
    }

    @Test
    func `rotateLeft by multiple of bitWidth returns original`() {
        let value: UInt8 = 0b10101010
        #expect(value.rotateLeft(by: 16) == value)
        #expect(value.rotateLeft(by: 24) == value)
    }

    @Test
    func `rotateLeft preserves bit count`() {
        let value: UInt8 = 0b11010011
        let rotated = value.rotateLeft(by: 3)

        #expect(value.nonzeroBitCount == rotated.nonzeroBitCount)
    }

    @Test
    func `rotateLeft works with UInt16`() {
        let value: UInt16 = 0b11000000_00000011
        let rotated = value.rotateLeft(by: 4)
        #expect(rotated == 0b00000000_00111100)
    }

    @Test
    func `rotateRight by zero returns original`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateRight(by: 0) == value)
    }

    @Test(arguments: [
        (0b11010011 as UInt8, 1, 0b11101001 as UInt8),
        (0b11010011 as UInt8, 2, 0b11110100 as UInt8),
        (0b11010011 as UInt8, 4, 0b00111101 as UInt8),
        (0b00000001 as UInt8, 1, 0b10000000 as UInt8),
    ])
    func `rotateRight shifts bits circularly`(testCase: (UInt8, Int, UInt8)) {
        let (value, count, expected) = testCase
        #expect(value.rotateRight(by: count) == expected)
    }

    @Test
    func `rotateRight by bitWidth returns original`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateRight(by: 8) == value)
    }

    @Test
    func `rotateRight is inverse of rotateLeft`() {
        let value: UInt8 = 0b11010011
        let count = 3

        let leftThenRight = value.rotateLeft(by: count).rotateRight(by: count)
        let rightThenLeft = value.rotateRight(by: count).rotateLeft(by: count)

        #expect(leftThenRight == value)
        #expect(rightThenLeft == value)
    }

    @Test
    func `rotateRight preserves bit count`() {
        let value: UInt8 = 0b11010011
        let rotated = value.rotateRight(by: 5)

        #expect(value.nonzeroBitCount == rotated.nonzeroBitCount)
    }

    @Test(arguments: [
        (0b11010011 as UInt8, 0b11001011 as UInt8),
        (0b10000000 as UInt8, 0b00000001 as UInt8),
        (0b00000001 as UInt8, 0b10000000 as UInt8),
        (0b11111111 as UInt8, 0b11111111 as UInt8),
        (0b00000000 as UInt8, 0b00000000 as UInt8),
    ])
    func `reverseBits reverses bit order`(testCase: (UInt8, UInt8)) {
        let (value, expected) = testCase
        #expect(value.reverseBits() == expected)
    }

    @Test
    func `reverseBits is an involution`() {
        let value: UInt8 = 0b11010011
        let reversed = value.reverseBits()
        let doubleReversed = reversed.reverseBits()

        #expect(doubleReversed == value)
    }

    @Test
    func `reverseBits preserves bit count`() {
        let value: UInt8 = 0b11010011
        let reversed = value.reverseBits()

        #expect(value.nonzeroBitCount == reversed.nonzeroBitCount)
    }

    @Test
    func `reverseBits works with UInt16`() {
        let value: UInt16 = 0b10000000_00000001
        let reversed = value.reverseBits()

        #expect(reversed == 0b10000000_00000001)
    }

    @Test
    func `reverseBits palindrome`() {
        let palindrome: UInt8 = 0b10011001
        #expect(palindrome.reverseBits() == palindrome)
    }

    @Test
    func `UInt8 rotations`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateLeft(by: 1) == 0b10100111)
        #expect(value.rotateRight(by: 1) == 0b11101001)
    }

    @Test
    func `UInt16 rotations`() {
        let value: UInt16 = 0b11000000_00000011
        #expect(value.rotateLeft(by: 4) == 0b00000000_00111100)
    }

    @Test
    func `UInt32 rotations`() {
        let value: UInt32 = 0x1234_5678
        let rotated = value.rotateLeft(by: 8)
        #expect(rotated == 0x3456_7812)
    }

    @Test
    func `UInt64 rotations`() {
        let value: UInt64 = 0x1234_5678_9ABC_DEF0
        let rotated = value.rotateLeft(by: 16)
        #expect(rotated == 0x5678_9ABC_DEF0_1234)
    }

    @Test
    func `Int8 bits reverse`() {
        let value: Int8 = 0b01010101
        let reversed = value.reverseBits()

        #expect(reversed == -86)
    }

    @Test
    func `Int16 bits reverse`() {
        let value: Int16 = 0b00000000_11111111
        let reversed = value.reverseBits()

        #expect(reversed == -256)
    }
}

extension `FixedWidthInteger+Bit Tests`.`Edge Case` {

    @Test(arguments: [
        (0b11010011 as UInt8, -1, 0b11101001 as UInt8),
        (0b11010011 as UInt8, -2, 0b11110100 as UInt8),
        (0b11010011 as UInt8, -8, 0b11010011 as UInt8),
        (0b11010011 as UInt8, -9, 0b11101001 as UInt8),
    ])
    func `rotateLeft with negative count matches equivalent positive rotateRight`(
        testCase: (UInt8, Int, UInt8)
    ) {
        let (value, count, expected) = testCase
        #expect(value.rotateLeft(by: count) == expected)
    }

    @Test(arguments: [
        (0b11010011 as UInt8, -1, 0b10100111 as UInt8),
        (0b11010011 as UInt8, -2, 0b01001111 as UInt8),
        (0b11010011 as UInt8, -8, 0b11010011 as UInt8),
        (0b11010011 as UInt8, -9, 0b10100111 as UInt8),
    ])
    func `rotateRight with negative count matches equivalent positive rotateLeft`(
        testCase: (UInt8, Int, UInt8)
    ) {
        let (value, count, expected) = testCase
        #expect(value.rotateRight(by: count) == expected)
    }

    @Test
    func `rotateLeft and rotateRight by negative count are mutual inverses`() {
        let value: UInt16 = 0b1101_0011_1010_0110
        #expect(value.rotateLeft(by: -5).rotateRight(by: -5) == value)
        #expect(value.rotateRight(by: -5).rotateLeft(by: -5) == value)
    }

    @Test
    func `rotateLeft by count far beyond bitWidth normalizes correctly`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateLeft(by: 100) == value.rotateLeft(by: 100 % 8))
        #expect(value.rotateLeft(by: -100) == value.rotateLeft(by: -100 % 8 + 8))
    }

    @Test
    func `rotateRight by count far beyond bitWidth normalizes correctly`() {
        let value: UInt8 = 0b11010011
        #expect(value.rotateRight(by: 100) == value.rotateRight(by: 100 % 8))
        #expect(value.rotateRight(by: -100) == value.rotateRight(by: -100 % 8 + 8))
    }

    @Test
    func `rotateLeft on negative Int8 does not sign-extend into the result`() {
        let value: Int8 = -1
        #expect(value.rotateLeft(by: 1) == -1)
        #expect(value.rotateLeft(by: 4) == -1)
    }

    @Test
    func `rotateRight on negative Int8 does not sign-extend into the result`() {
        let value: Int8 = -1
        #expect(value.rotateRight(by: 1) == -1)
        #expect(value.rotateRight(by: 4) == -1)
    }

    @Test
    func `rotateLeft on signed Int8 matches unsigned bit-pattern rotation`() {
        let signed: Int8 = -100
        let unsigned = UInt8(bitPattern: signed)

        (-10...10).forEach { count in
            let rotatedSigned = signed.rotateLeft(by: count)
            let rotatedUnsigned = unsigned.rotateLeft(by: count)
            #expect(UInt8(bitPattern: rotatedSigned) == rotatedUnsigned)
        }
    }

    @Test
    func `rotateRight on signed Int8 matches unsigned bit-pattern rotation`() {
        let signed: Int8 = -100
        let unsigned = UInt8(bitPattern: signed)

        (-10...10).forEach { count in
            let rotatedSigned = signed.rotateRight(by: count)
            let rotatedUnsigned = unsigned.rotateRight(by: count)
            #expect(UInt8(bitPattern: rotatedSigned) == rotatedUnsigned)
        }
    }

    @Test
    func `rotateLeft on negative Int16 preserves nonzero bit count`() {
        let value: Int16 = -12345
        let rotated = value.rotateLeft(by: 7)
        #expect(rotated.nonzeroBitCount == value.nonzeroBitCount)
    }

    @Test
    func `rotateRight on negative Int32 preserves nonzero bit count`() {
        let value: Int32 = -987_654_321
        let rotated = value.rotateRight(by: 11)
        #expect(rotated.nonzeroBitCount == value.nonzeroBitCount)
    }
}
