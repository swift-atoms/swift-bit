public import Affine
public import Byte
public import Index
public import Ordinal
public import Tagged

extension Bit.Index {

    @inlinable
    public init(
        _ index: Index<Byte>
    ) {
        let bits = index.underlying.rawValue
            * UInt(Affine.Discrete.Ratio<Byte, Bit>.bitsPerByte.factor)
        self.init(_unchecked: Ordinal(bits))
    }

    @inlinable
    public init(
        _ byteIndex: Index<Byte>,
        offset: Affine.Discrete.Vector
    ) throws(Ordinal.Error) {
        let base = Bit.Index(byteIndex).underlying.rawValue
        if offset.rawValue >= 0 {
            let (sum, overflow) = base.addingReportingOverflow(UInt(offset.rawValue))
            guard !overflow else { throw .overflow }
            self.init(_unchecked: Ordinal(sum))
        } else {
            let magnitude = UInt(offset.rawValue.magnitude)
            guard base >= magnitude else { throw .underflow }
            self.init(_unchecked: Ordinal(base - magnitude))
        }
    }
}
