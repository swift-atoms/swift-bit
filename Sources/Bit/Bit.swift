@frozen
public enum Bit {

    case zero

    case one
}

extension Bit: Equatable {}

extension Bit: Hashable {}

extension Bit: CaseIterable {
    public static var allCases: [Bit] { [.zero, .one] }
}
