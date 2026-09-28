#if Algebra
public import Algebra
extension Bit {

    @inlinable
    public static var z2: Algebra.Field<Self> {
        .init(
            additive: .init(
                group: .init(
                    identity: .zero,
                    combining: { ($0 == $1 ? .zero : .one) },
                    inverting: { $0 }
                )
            ),
            multiplicative: .init(
                monoid: .init(
                    identity: .one,
                    combining: { ($0 == .one && $1 == .one ? .one : .zero) }
                )
            ),
            reciprocal: { (element: Self) throws(Algebra.Field<Self>.Error) -> Self in
                guard element == .one else { throw .nonInvertible }
                return element
            }
        )
    }
}
#endif
