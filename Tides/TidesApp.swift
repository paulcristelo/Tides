//
//  TidesApp.swift
//  Tides
//
//  Created by Paul Cristelo on 9/21/23.
//

import SwiftUI

@main
struct TidesApp: App {

    var body: some Scene {
        WindowGroup {
			if let savedLocations = UserDefaults.standard.array(forKey: "SavedLocations") as? [String] {
				ContentView(locations: savedLocations)
			} else {
				ContentView()
			}
        }
    }
}
