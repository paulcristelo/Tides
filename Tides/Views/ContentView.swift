//
//  ContentView.swift
//  Tides
//
//  Created by Paul Cristelo on 9/21/23.
//

import SwiftUI

enum activeSheet: Identifiable {
	case addLocation, detail
	
	var id: Int {
		switch self {
			case .addLocation: return 0
			case .detail: return 1
		}
	}
}


struct ContentView: View {
	
	@State private var locations: [String] {
		didSet {
			UserDefaults.standard.set(locations, forKey: "SavedLocations")
		}
	}
		
	init() {
		if let savedLocations = UserDefaults.standard.array(forKey: "SavedLocations") as? [String] {
			_locations = State(initialValue: savedLocations)
		} else {
			_locations = State(initialValue: [])
		}
	}
	
	@State private var selectedLocation: Location? = nil
	@State private var newLocation: Location? = nil
	@State private var activeSheet: activeSheet? = nil
	
	init(locations: [String]) {
		_locations = State(initialValue: locations)
	}
	
	func buttonPress(location: String, id: String) {
		selectedLocation = Location(name: location, id: id)
		activeSheet = .detail
	}
	
	var body: some View {
		
		NavigationStack {
			VStack {
				if locations.isEmpty {
					Text("No locations added yet")
						.padding()
				}
				ForEach(locations, id: \.self) { location in
					if let id = LocationManager.shared.all[location] {
						Button(action: {
							buttonPress(location: location, id: id)
						}) {
							CardView(location: Location(name: location, id: id))
						}
					} else {
						Text("Location ID not found for \(location)")
						
					}
				}
				.sheet(item: $activeSheet) { item in
					switch item {
					case .addLocation:
						AddLocationView(newLocation: $newLocation, locations: $locations)
					case .detail:
							DetailView(location: selectedLocation ?? Location(name: "Error", id: "Error"))
					}
				}
			}.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { activeSheet = .addLocation }) {
						Image(systemName: "plus")
					}
				}
			}
			.navigationTitle("Locations")
			.navigationBarTitleDisplayMode(.inline)
			
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(locations: ["Cape May, NJ", "Pearl Harbor, HI", "Lewes, DE", "Sandy Hook, NJ"])
	}
}
