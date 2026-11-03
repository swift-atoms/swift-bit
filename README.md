# swift-bit

Use this package when a value is a single binary digit and should be typed as one rather than as `Swift.Bool`: start from `Bit`, convert at the edges with `Bit.init(_:)` and `Swift.Bool.init(_:)`, and enable the `Finite` trait to treat `Bit` as a two-element finite type or the `Algebra` trait to compute with it as a Boolean algebra or as the field `Bit.z2`. For a mask or field of several bits inside a fixed-width integer use swift-bit-pattern, and for a set of bit positions use swift-bitset.

## Laws

- `Bit.one` corresponds to `true` and `Bit.zero` to `false`; converting either way and back returns the original value.
- `Bit` occupies exactly one byte (size and stride).
- `Bit.allCases` and the `Finite.Enumerable` ordinals agree on the order `Bit.zero` (ordinal 0), then `Bit.one` (ordinal 1); `Bit.count` is 2.
- `Bit.init(_unchecked:ordinal:)` does not validate its ordinal: 0 gives `Bit.zero` and every other ordinal gives `Bit.one`.
- Two arithmetic structures are provided and must not be confused. The Boolean structure (`Algebra.Monoid<Bit>`, `Algebra.Semilattice<Bit>`, `Algebra.Semiring<Bit>.Commutative`, `Algebra.Lattice<Bit>`) adds with OR and multiplies with AND: `.disjunction` has identity `Bit.zero`, `.conjunction` has identity `Bit.one`. The field `Bit.z2` adds with XOR and multiplies with AND.
- `Algebra.Lattice<Bit>` orders `Bit.zero` below `Bit.one`: join is OR, meet is AND, bottom is `Bit.zero`, top is `Bit.one`. It satisfies absorption, distributivity and complementation (each element's complement is the other case).
- In `Bit.z2` every element is its own additive inverse; `Bit.one` is its own reciprocal, and asking for the reciprocal of `Bit.zero` throws.
