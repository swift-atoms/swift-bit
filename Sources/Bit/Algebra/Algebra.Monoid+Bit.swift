#if Algebra
public import Algebra

extension Algebra.Monoid where Element == Bit {

    @inlinable
    public static var conjunction: Self {
        .init(identity: .one, combining: { ($0 == .one && $1 == .one ? .one : .zero) })
    }

    @inlinable
    public static var disjunction: Self {
        .init(identity: .zero, combining: { ($0 == .one || $1 == .one ? .one : .zero) })
    }
}
#endif
