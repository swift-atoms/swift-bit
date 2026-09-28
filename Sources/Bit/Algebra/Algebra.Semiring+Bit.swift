#if Algebra
public import Algebra

extension Algebra.Semiring.Commutative where Element == Bit {

    @inlinable
    public init() {
        self.init(
            semiring: .init(
                additive: .init(monoid: .init(identity: .zero, combining: { ($0 == .one || $1 == .one ? .one : .zero) })),
                multiplicative: .init(identity: .one, combining: { ($0 == .one && $1 == .one ? .one : .zero) })
            )
        )
    }
}
#endif
