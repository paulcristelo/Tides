//
//  Location.swift
//  Tides
//
//  Created by Paul Cristelo on 9/21/23.
//

import Foundation

import Foundation

class Location: ObservableObject, Identifiable {
	let name: String
	let id: String
	
	var time: String?
	var comparedWaterLevel: String?
	
	@Published var waterLevel: String?
	@Published var newWaterLevels: [WaterLevelData]
	@Published var oldWaterLevels: [WaterLevelData]


	init(name: String, id: String) {
		self.name = name
		self.id = id
		self.newWaterLevels = []
		self.oldWaterLevels = []
		LocationManager.shared.fetchWaterLevel(location: self)
	}
	
}
