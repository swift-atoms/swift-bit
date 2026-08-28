import Bit

extension Bit: CustomStringConvertible {

    public var description: String {
        switch self {
        case .zero: "0"
        case .one: "1"
        }
    }
}
