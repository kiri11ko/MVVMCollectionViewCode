

import Foundation

struct JsonBase : Codable {
	let jDataList : [JData]?
	let meta : Meta?
	let pagination : Pagination?

	enum CodingKeys: String, CodingKey {

		case jDataList = "data"
		case meta = "meta"
		case pagination = "pagination"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		jDataList = try values.decodeIfPresent([JData].self, forKey: .jDataList)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
		pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
	}

}
