//
//  test.swift
//  Tides
//
//  Created by Paul Cristelo on 10/7/23.
//

import SwiftUI

struct test: View {
	
	@ObservedObject var location: Location
    var body: some View {
		VStack {
			ScrollView {
				ForEach(location.oldWaterLevels) { waterLevel in
					Text("\(waterLevel.t) \(waterLevel.v)")
				}
			}
			
		}
		.onAppear() {
			LocationManager.shared.fetchOldWaterLevel(location: location)
		}
				
    }
}

#Preview {
	test(location: Location(name: "Cape May, NJ", id: "8536110"))
}
