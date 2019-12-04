import Foundation

struct JsonBase: Codable {
	let jDataList: [JData]?

	enum CodingKeys: String, CodingKey {

		case jDataList = "data"

	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		jDataList = try values.decodeIfPresent([JData].self, forKey: .jDataList)
	}

}
