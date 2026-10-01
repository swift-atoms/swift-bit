#if Finite
public import Cardinal
public import Finite
import Index
public import Ordinal
import Tagged

extension Bit: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(2) }

    @inlinable
    public var ordinal: Ordinal { self == .zero ? Ordinal(0) : Ordinal(1) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = ordinal.rawValue == 0 ? .zero : .one
    }
}

#endif
