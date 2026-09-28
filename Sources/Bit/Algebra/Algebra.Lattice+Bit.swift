#if Algebra
public import Algebra

extension Algebra.Lattice where Element == Bit {

    @inlinable
    public init() {
        self.init(join: .disjunction, meet: .conjunction)
    }
}
#endif
