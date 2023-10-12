//
//  DetailView.swift
//  Tides
//
//  Created by Paul Cristelo on 9/23/23.
//

import SwiftUI
import Charts

struct DetailView: View {
    @ObservedObject var location: Location
	@State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
	var body: some View {
		VStack(alignment: .leading) {
			Text(location.name)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
				.padding()
			Spacer()
			Chart(location.oldWaterLevels) {
				LineMark(
					x: .value("Time", "\($0.t)"),
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
			.foregroundStyle(.black)
			.padding()
		}
		.foregroundStyle(.black)
		.background(.cyan)
		.onAppear() {
			LocationManager.shared.fetchOldWaterLevel(location: location)
			LocationManager.shared.fetchWaterLevel(location: location)
		}
		.onReceive(timer) { _ in
			LocationManager.shared.fetchWaterLevel(location: location)
		}
	}
		
}

#Preview {
	DetailView(location: Location(name: "Cape May, NJ", id: LocationManager.shared.all["Cape May, NJ"] ?? "None Found"))
}
