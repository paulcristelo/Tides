//
//  AddLocationView.swift
//  Tides
//
//  Created by Paul Cristelo on 10/8/23.
//

import SwiftUI

struct AddLocationView: View {
	@Binding var savedLocations: [String]
    var body: some View {
		
		NavigationView {
			ScrollView {
				Spacer()
				ForEach(LocationManager.shared.sortedLocations, id: \.self) { location in
					Button(action: {
						savedLocations = addLocation(location: location, savedLocations: savedLocations)
						presentationMode.wrappedValue.dismiss()
					}) {
						Text(location)
					}
				}
				Spacer()
			}
			.navigationTitle("Add Location")
			.toolbarTitleDisplayMode(.inline)
		}
		
    }
	@Environment(\.presentationMode) var presentationMode
}

struct AddLocationView_Previews: PreviewProvider {
	@State static private var previewLocations: [String] = []

	static var previews: some View {
		AddLocationView(savedLocations: $previewLocations)
	}
}

