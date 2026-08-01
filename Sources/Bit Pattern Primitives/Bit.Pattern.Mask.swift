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

// MARK: - Mask

extension Bit.Pattern {
    /// A bitmask in the carrier ring.
    ///
    /// Masks represent bit patterns for selection, filtering, or field extraction.
    /// All operations are well-defined within the ring Z/2^w.
    ///
    /// ## Ring Laws
    ///
    /// - `a & b` — intersection (meet)
    /// - `a | b` — union (join)
    /// - `~a` — complement in Z/2^w
    ///
    /// ## Example
    ///
    /// ```swift
    /// typealias Mask32 = Bit.Pattern<UInt32>.Mask
    /// let low8 = Mask32.lowBits(8)      // 0x000000FF
    /// let high24 = ~low8                 // 0xFFFFFF00
    /// let combined = low8 | .lowBits(16) // 0x0000FFFF
    /// ```
    public struct Mask: Sendable, Equatable, Hashable {
        /// The raw bitmask value.
        public let underlying: Carrier

        /// Creates a mask from a raw value.
        @inlinable
        public init(_ underlying: Carrier) {
            self.underlying = underlying
        }
    }
}
