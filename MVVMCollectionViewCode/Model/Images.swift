

import Foundation

struct Images : Codable {
	let fixed_height : Fixed_height?
	let fixed_height_still : Fixed_height_still?
	let fixed_height_downsampled : Fixed_height_downsampled?
	let fixed_width : Fixed_width?
	let fixed_width_still : Fixed_width_still?
	let fixed_width_downsampled : Fixed_width_downsampled?
	let fixed_height_small : Fixed_height_small?
	let fixed_height_small_still : Fixed_height_small_still?
	let fixed_width_small : Fixed_width_small?
	let fixed_width_small_still : Fixed_width_small_still?
	let downsized : Downsized?
	let downsized_still : Downsized_still?
	let downsized_large : Downsized_large?
	let original : Original?
	let original_still : Original_still?

	enum CodingKeys: String, CodingKey {

		case fixed_height = "fixed_height"
		case fixed_height_still = "fixed_height_still"
		case fixed_height_downsampled = "fixed_height_downsampled"
		case fixed_width = "fixed_width"
		case fixed_width_still = "fixed_width_still"
		case fixed_width_downsampled = "fixed_width_downsampled"
		case fixed_height_small = "fixed_height_small"
		case fixed_height_small_still = "fixed_height_small_still"
		case fixed_width_small = "fixed_width_small"
		case fixed_width_small_still = "fixed_width_small_still"
		case downsized = "downsized"
		case downsized_still = "downsized_still"
		case downsized_large = "downsized_large"
		case original = "original"
		case original_still = "original_still"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fixed_height = try values.decodeIfPresent(Fixed_height.self, forKey: .fixed_height)
		fixed_height_still = try values.decodeIfPresent(Fixed_height_still.self, forKey: .fixed_height_still)
		fixed_height_downsampled = try values.decodeIfPresent(Fixed_height_downsampled.self, forKey: .fixed_height_downsampled)
		fixed_width = try values.decodeIfPresent(Fixed_width.self, forKey: .fixed_width)
		fixed_width_still = try values.decodeIfPresent(Fixed_width_still.self, forKey: .fixed_width_still)
		fixed_width_downsampled = try values.decodeIfPresent(Fixed_width_downsampled.self, forKey: .fixed_width_downsampled)
		fixed_height_small = try values.decodeIfPresent(Fixed_height_small.self, forKey: .fixed_height_small)
		fixed_height_small_still = try values.decodeIfPresent(Fixed_height_small_still.self, forKey: .fixed_height_small_still)
		fixed_width_small = try values.decodeIfPresent(Fixed_width_small.self, forKey: .fixed_width_small)
		fixed_width_small_still = try values.decodeIfPresent(Fixed_width_small_still.self, forKey: .fixed_width_small_still)
		downsized = try values.decodeIfPresent(Downsized.self, forKey: .downsized)
		downsized_still = try values.decodeIfPresent(Downsized_still.self, forKey: .downsized_still)
		downsized_large = try values.decodeIfPresent(Downsized_large.self, forKey: .downsized_large)
		original = try values.decodeIfPresent(Original.self, forKey: .original)
		original_still = try values.decodeIfPresent(Original_still.self, forKey: .original_still)
	}

}
