import Foundation

struct Images: Codable {

	let original: Original?

	enum CodingKeys: String, CodingKey {

		case original = "original"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		original = try values.decodeIfPresent(Original.self, forKey: .original)
	}

}
