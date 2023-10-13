//
//  CardView.swift
//  Tides
//
//  Created by Paul Cristelo on 9/29/23.
//

import SwiftUI

struct CardView: View {
	@ObservedObject var location: Location
	@State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
	var body: some View {
		VStack(alignment: .leading) {
			Text(location.name)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
			Spacer()
			HStack {
				Label("\(location.id)", systemImage: "number")
				Spacer()
				if let waterLevel = location.waterLevel {
					if location.comparedWaterLevel != nil {
						if waterLevel > location.comparedWaterLevel! {
							Label("\(waterLevel)", systemImage: "water.waves.and.arrow.up")
						} else if waterLevel < location.comparedWaterLevel!{
							Label("\(waterLevel)", systemImage: "water.waves.and.arrow.down")
						} else {
							Label("\(waterLevel)", systemImage: "water.waves")
						}
					} else {
						Label("\(waterLevel)", systemImage: "water.waves")
					}
				} else {
					Label("Loading...", systemImage: "hourglass")
				}
			}
			.font(.caption)
		}
		.padding()
		.frame(width: UIScreen.main.bounds.width, height: 60)
		.foregroundColor(.black)
		.background(.cyan)
		.onReceive(timer) { _ in
			location.fetchWaterLevel()
		}
		.onAppear() {
			location.fetchWaterLevel()
		}
	}
}

struct CardView_Previews: PreviewProvider {
	static var location = Location(name: "Cape May, NJ", id: LocationManager.shared.all["Cape May, NJ"] ?? "0000000")
	static var previews: some View {
		CardView(location: location)
	}
}
