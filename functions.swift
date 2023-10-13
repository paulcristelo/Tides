//
//  functions.swift
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

func convertDateString(input: String) -> String? {
	// Create a DateFormatter for the input format
	let inputFormatter = DateFormatter()
	inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
	
	// Create a DateFormatter for the output format
	let outputFormatter = DateFormatter()
	outputFormatter.dateFormat = "h:mma MM-dd-yyyy"
	
	// Convert the input string to a Date object
	if let date = inputFormatter.date(from: input) {
		// Convert the Date object to the output string format
		let outputString = outputFormatter.string(from: date)
		return outputString
	} else {
		return nil
	}
}


