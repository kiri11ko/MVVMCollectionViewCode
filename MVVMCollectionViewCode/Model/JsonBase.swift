

import Foundation

struct JsonBase : Codable {
	let data : [JData]?
	let meta : Meta?
	let pagination : Pagination?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case meta = "meta"
		case pagination = "pagination"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([JData].self, forKey: .data)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
		pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
	}

}
