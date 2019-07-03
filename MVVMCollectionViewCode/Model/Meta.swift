

import Foundation
struct Meta : Codable {
	let status : Int?
	let msg : String?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case msg = "msg"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		msg = try values.decodeIfPresent(String.self, forKey: .msg)
	}

}
