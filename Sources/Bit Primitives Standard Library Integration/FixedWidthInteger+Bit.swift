// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-bit-primitives open source project
//
// Copyright (c) 2024-2026 Coen ten Thije Boonkkamp and the swift-bit-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

// MARK: - Bit Rotation

extension FixedWidthInteger {
    /// Rotates bits left by the specified count.
    ///
    /// Performs a circular left shift, preserving all bits. Unlike a standard left shift
    /// which fills vacated positions with zeros, rotation wraps bits from the left end
    /// to the right end.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let rotated = UInt8.rotateLeft(x, by: 2)
    /// // 0b01001111  // Binary: 01001111
    /// ```
    ///
    /// - Parameters:
    ///   - value: The value to rotate
    ///   - count: Number of positions to rotate left. May be negative (rotates
    ///     right) or larger in magnitude than `bitWidth` (normalized modulo
    ///     `bitWidth` via a Euclidean remainder, so the result is always a
    ///     genuine rotation, never a sign-extended shift).
    /// - Returns: The value with bits rotated left
    @inlinable
    public static func rotateLeft(_ value: Self, by count: Int) -> Self {
        let width = Self.bitWidth
        // Euclidean remainder: Swift's `%` can return a negative result for a
        // negative `count` (e.g. -1 % 8 == -1), and the masking `<<`/`>>`
        // operators treat a negative or out-of-range shift amount specially
        // rather than rotating — so normalize into 0..<width first.
        let shift = ((count % width) + width) % width
        guard shift != 0 else { return value }

        // Rotate over the type's unsigned bit pattern. `Self.Magnitude`'s `>>`
        // is a logical (zero-filling) shift even when `Self` itself is signed,
        // where the standard arithmetic (sign-extending) `>>` on `Self` would
        // smear the sign bit into the rotated-in positions and corrupt the
        // result. `Magnitude(truncatingIfNeeded:)` / `Self(truncatingIfNeeded:)`
        // between a fixed-width type and its same-width `Magnitude` reinterpret
        // the bits rather than clamping, so no information is lost.
        let bits = Magnitude(truncatingIfNeeded: value)
        let rotated = (bits << shift) | (bits >> (width - shift))
        return Self(truncatingIfNeeded: rotated)
    }

    /// Rotates bits left by the specified count.
    ///
    /// Performs a circular left shift, preserving all bits. Unlike a standard left shift
    /// which fills vacated positions with zeros, rotation wraps bits from the left end
    /// to the right end.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let rotated = x.rotateLeft(by: 2)
    /// // 0b01001111  // Binary: 01001111
    /// ```
    ///
    /// - Parameter count: Number of positions to rotate left
    /// - Returns: The value with bits rotated left
    @inlinable
    public func rotateLeft(by count: Int) -> Self {
        Self.rotateLeft(self, by: count)
    }

    /// Rotates bits right by the specified count.
    ///
    /// Performs a circular right shift, preserving all bits. Unlike a standard right shift
    /// which fills vacated positions with zeros or sign bits, rotation wraps bits from
    /// the right end to the left end.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let rotated = UInt8.rotateRight(x, by: 2)
    /// // 0b11110100  // Binary: 11110100
    /// ```
    ///
    /// - Parameters:
    ///   - value: The value to rotate
    ///   - count: Number of positions to rotate right. May be negative (rotates
    ///     left) or larger in magnitude than `bitWidth` (normalized modulo
    ///     `bitWidth` via a Euclidean remainder, so the result is always a
    ///     genuine rotation, never a sign-extended shift).
    /// - Returns: The value with bits rotated right
    @inlinable
    public static func rotateRight(_ value: Self, by count: Int) -> Self {
        let width = Self.bitWidth
        // See `rotateLeft(_:by:)` for why the count is normalized with a
        // Euclidean remainder and the rotation is performed over the unsigned
        // bit pattern rather than `Self` directly.
        let shift = ((count % width) + width) % width
        guard shift != 0 else { return value }

        let bits = Magnitude(truncatingIfNeeded: value)
        let rotated = (bits >> shift) | (bits << (width - shift))
        return Self(truncatingIfNeeded: rotated)
    }

    /// Rotates bits right by the specified count.
    ///
    /// Performs a circular right shift, preserving all bits. Unlike a standard right shift
    /// which fills vacated positions with zeros or sign bits, rotation wraps bits from
    /// the right end to the left end.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let rotated = x.rotateRight(by: 2)
    /// // 0b11110100  // Binary: 11110100
    /// ```
    ///
    /// - Parameter count: Number of positions to rotate right
    /// - Returns: The value with bits rotated right
    @inlinable
    public func rotateRight(by count: Int) -> Self {
        Self.rotateRight(self, by: count)
    }

    /// Reverses the order of all bits.
    ///
    /// Reflects the bit pattern, swapping bit positions from ends to middle.
    /// Useful in FFT algorithms, cryptography, and binary protocol implementations.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let reversed = UInt8.reverseBits(x)
    /// // 0b11001011  // Binary: 11001011
    /// ```
    ///
    /// - Parameter value: The value to reverse
    /// - Returns: The value with all bits in reversed order
    @inlinable
    public static func reverseBits(_ value: Self) -> Self {
        var result: Self = 0
        var workingValue = value

        for _ in 0..<Self.bitWidth {
            result <<= 1
            result |= workingValue & 1
            workingValue >>= 1
        }

        return result
    }

    /// Reverses the order of all bits.
    ///
    /// Reflects the bit pattern, swapping bit positions from ends to middle.
    /// Useful in FFT algorithms, cryptography, and binary protocol implementations.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let x: UInt8 = 0b11010011  // Binary: 11010011
    /// let reversed = x.reverseBits()
    /// // 0b11001011  // Binary: 11001011
    /// ```
    ///
    /// - Returns: The value with all bits in reversed order
    @inlinable
    public func reverseBits() -> Self {
        Self.reverseBits(self)
    }
}
