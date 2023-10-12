//
//  addLocation.swift
//  Tides
//
//  Created by Paul Cristelo on 10/12/23.
//

import Foundation

func addLocation(location: String, savedLocations: [String]) -> [String] {
	if let id = LocationManager.shared.all[location] {
		return savedLocations + [(Location(name: location, id: id).name)]
	} else {
		return savedLocations
	}
}
