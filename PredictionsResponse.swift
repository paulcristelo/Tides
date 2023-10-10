//
//  WaterLevelPredictionResponse.swift
//  Tides
//
//  Created by Paul Cristelo on 9/28/23.
//

import Foundation

// Define a struct for the entire JSON object
struct PredictionsResponse: Codable {
	let predictions: [Prediction]
}

// Define a struct for an individual prediction
struct Prediction: Codable {
	let t: String
	let v: String
}

