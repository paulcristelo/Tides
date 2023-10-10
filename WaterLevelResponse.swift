//
//  WaterLevelResponse.swift
//  Tides
//
//  Created by Paul Cristelo on 9/21/23.
//

import Foundation

struct WaterLevelResponse: Codable {
	let metadata: Metadata
	let data: [WaterLevelData]
}

struct WaterLevelData: Codable, Identifiable {
	let id: UUID  // Now id is a UUID, but it's not decoded from JSON
	let t: String  // Time
	let v: String  // Value
	
	// Define the keys we expect in the JSON
	enum CodingKeys: String, CodingKey {
		case t, v
	}
	
	// A custom initializer that generates a UUID for id
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.t = try container.decode(String.self, forKey: .t)
		self.v = try container.decode(String.self, forKey: .v)
		self.id = UUID()  // Generate a new UUID for id
	}
}


struct Metadata: Codable {
	let name: String
	let id: String
}


