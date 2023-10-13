//
//  DetailView.swift
//  Tides
//
//  Created by Paul Cristelo on 9/23/23.
//

import SwiftUI
import Charts

struct DetailView: View {
	@ObservedObject var selectedLocation: Location
	@State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
	var body: some View {
		VStack(alignment: .leading) {
			Text(selectedLocation.name)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
				.padding()
			Spacer()
			Chart(selectedLocation.oldWaterLevels) {
				LineMark(
					x: .value("Time", "\(convertDateString(input: $0.t) ?? "Error")"),
					y: .value("Water Level", Double($0.v) ?? 0)
				)
			}
			.background(.white)
			.frame(width: UIScreen.main.bounds.width)
			.chartYAxis {
				var yAxisValues: [Double] {
					stride(from: -5.0, through: 5.0, by: 1).map { $0 }
				}
				AxisMarks(values: yAxisValues)
			}
			Spacer()
			HStack {
				Label("\(selectedLocation.id)", systemImage: "number")
				Spacer()
				if let waterLevel = selectedLocation.waterLevel {
					if selectedLocation.comparedWaterLevel != nil {
						if waterLevel > selectedLocation.comparedWaterLevel! {
							Label("\(waterLevel)", systemImage: "water.waves.and.arrow.up")
						} else if waterLevel < selectedLocation.comparedWaterLevel!{
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
			.foregroundStyle(.black)
			.padding()
		}
		.foregroundStyle(.black)
		.background(.cyan)
		.onAppear() {
			selectedLocation.fetchOldWaterLevel()
			selectedLocation.fetchWaterLevel()
		}
		.onReceive(timer) { _ in
			selectedLocation.fetchWaterLevel()
		}
	}
		
}

#Preview {
	DetailView(selectedLocation: Location(name: "Cape May, NJ", id: LocationManager.shared.all["Cape May, NJ"] ?? "None Found"))
}
