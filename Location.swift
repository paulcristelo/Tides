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
	@Published var oldWaterLevels: [WaterLevelData] = []


	init(name: String, id: String) {
		self.name = name
		self.id = id
		self.fetchWaterLevel()
		self.fetchOldWaterLevel()
	}
	
	func fetchWaterLevel() {
		let urlString = "https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?date=latest&station=\(self.id)&product=one_minute_water_level&datum=MSL&time_zone=lst_ldt&units=english&format=json"

		guard let url = URL(string: urlString) else {
			print("Invalid URL")
			return
			
		}

		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Network error: \(error)")
				return
			}

			if let data = data {
				do {
					let decoder = JSONDecoder()
					let waterLevelResponse = try decoder.decode(WaterLevelResponse.self, from: data)
					if let firstData = waterLevelResponse.data.first {
						DispatchQueue.main.async {
							self.comparedWaterLevel = self.waterLevel
							self.waterLevel = firstData.v
						}
					}
				} catch {
					print("Error decoding JSON: \(error)")
				}
			}
		}
		task.resume()
	}
	
	func fetchOldWaterLevel() {
		let urlString = "https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?begin_date=20231012&range=30&station=\(self.id)&product=one_minute_water_level&datum=MSL&time_zone=lst_ldt&units=english&format=json"

		guard let url = URL(string: urlString) else {
			print("Invalid URL")
			return
			
		}

		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Network error: \(error)")
				return
			}

			if let data = data {
				do {
					let decoder = JSONDecoder()
					let waterLevelResponse = try decoder.decode(WaterLevelResponse.self, from: data)
					self.oldWaterLevels	= []
					DispatchQueue.main.async {
						for waterLevelData in waterLevelResponse.data {
							self.oldWaterLevels.append(waterLevelData)
						}
						print(self.oldWaterLevels)
					}
				} catch {
					print("Error decoding JSON: \(error)")
				}
			}
		}
		task.resume()
	}
	
}
