import Foundation

struct JData: Codable {

	let images: Images?

	enum CodingKeys: String, CodingKey {
		case images = "images"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
	}

}
