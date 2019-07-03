

import Foundation
struct Fixed_width : Codable {
	let url : String?
	let width : String?
	let height : String?
	let size : String?
	let mp4 : String?
	let mp4_size : String?
	let webp : String?
	let webp_size : String?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case width = "width"
		case height = "height"
		case size = "size"
		case mp4 = "mp4"
		case mp4_size = "mp4_size"
		case webp = "webp"
		case webp_size = "webp_size"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		width = try values.decodeIfPresent(String.self, forKey: .width)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		size = try values.decodeIfPresent(String.self, forKey: .size)
		mp4 = try values.decodeIfPresent(String.self, forKey: .mp4)
		mp4_size = try values.decodeIfPresent(String.self, forKey: .mp4_size)
		webp = try values.decodeIfPresent(String.self, forKey: .webp)
		webp_size = try values.decodeIfPresent(String.self, forKey: .webp_size)
	}

}
