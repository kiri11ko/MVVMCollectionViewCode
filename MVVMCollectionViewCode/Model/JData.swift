

import Foundation

struct JData : Codable {
	let type : String?
	let id : String?
	let slug : String?
	let url : String?
	let bitly_gif_url : String?
	let bitly_url : String?
	let embed_url : String?
	let username : String?
	let source : String?
	let rating : String?
	let caption : String?
	let content_url : String?
	let source_tld : String?
	let source_post_url : String?
	let import_datetime : String?
	let trending_datetime : String?
	let images : Images?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case id = "id"
		case slug = "slug"
		case url = "url"
		case bitly_gif_url = "bitly_gif_url"
		case bitly_url = "bitly_url"
		case embed_url = "embed_url"
		case username = "username"
		case source = "source"
		case rating = "rating"
		case caption = "caption"
		case content_url = "content_url"
		case source_tld = "source_tld"
		case source_post_url = "source_post_url"
		case import_datetime = "import_datetime"
		case trending_datetime = "trending_datetime"
		case images = "images"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		bitly_gif_url = try values.decodeIfPresent(String.self, forKey: .bitly_gif_url)
		bitly_url = try values.decodeIfPresent(String.self, forKey: .bitly_url)
		embed_url = try values.decodeIfPresent(String.self, forKey: .embed_url)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
		content_url = try values.decodeIfPresent(String.self, forKey: .content_url)
		source_tld = try values.decodeIfPresent(String.self, forKey: .source_tld)
		source_post_url = try values.decodeIfPresent(String.self, forKey: .source_post_url)
		import_datetime = try values.decodeIfPresent(String.self, forKey: .import_datetime)
		trending_datetime = try values.decodeIfPresent(String.self, forKey: .trending_datetime)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}
