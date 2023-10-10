//
//  AddLocationView.swift
//  Tides
//
//  Created by Paul Cristelo on 10/8/23.
//

import SwiftUI

struct AddLocationView: View {
	@Binding var newLocation: Location?
	@Binding var locations: [String]
    var body: some View {
		ScrollView {
			ForEach(LocationManager.shared.sortedLocations, id: \.self) { location in
				Button(action: {
					if let id = LocationManager.shared.all[location] {
						newLocation = Location(name: location, id: id)
						locations.append(newLocation!.name)
						presentationMode.wrappedValue.dismiss()
					}
				}) {
					Text(location)
				}
			}
			
		}
		.navigationTitle("Add Location")
		
    }
	@Environment(\.presentationMode) var presentationMode
}

struct AddLocationView_Previews: PreviewProvider {
	@State static private var previewLocation: Location? = nil
	@State static private var previewLocations: [String] = []

	static var previews: some View {
		AddLocationView(newLocation: $previewLocation, locations: $previewLocations)
	}
}

