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
	
	@State private var savedLocations: [String] {
		didSet {
			UserDefaults.standard.set(savedLocations, forKey: "SavedLocations")
		}
	}
		
	init(locations: [String]? = nil) {
		if let locations = locations {
			_savedLocations = State(initialValue: locations)
		} else if let savedLocations = UserDefaults.standard.array(forKey: "SavedLocations") as? [String] {
			_savedLocations = State(initialValue: savedLocations)
		} else {
			_savedLocations = State(initialValue: [])
		}
	}

	
	@State private var selectedLocation: Location? = nil
	@State private var newLocation: Location? = nil
	@State private var activeSheet: activeSheet? = nil
	
	
	func buttonPress(location: String, id: String) {
		selectedLocation = Location(name: location, id: id)
		activeSheet = .detail
	}
	
	var body: some View {
		
		NavigationStack {
			VStack {
				if savedLocations.isEmpty {
					Text("No locations added yet")
						.padding()
				}
				ForEach(savedLocations, id: \.self) { location in
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
			
			}
			.sheet(item: $activeSheet) { item in
				switch item {
				case .addLocation:
					AddLocationView(savedLocations: $savedLocations)
				case .detail:
					DetailView(selectedLocation: selectedLocation ?? Location(name: "Error", id: "Error"))
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: {
						print("Add location")
						activeSheet = .addLocation
					}) {
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
		ContentView()
	}
}
