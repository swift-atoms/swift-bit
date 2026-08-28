extension Bit.Order: CaseIterable {

    public static let allCases: [Bit.Order] = [.msb, .lsb]
}

#if !hasFeature(Embedded)
    extension Bit.Order: Codable {

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            switch value {
            case "msb": self = .msb
            case "lsb": self = .lsb

            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Expected 'msb' or 'lsb', got '\(value)'"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .msb: try container.encode("msb")
            case .lsb: try container.encode("lsb")
            }
        }
    }
#endif
