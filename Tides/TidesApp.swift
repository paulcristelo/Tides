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
            ContentView(locations: ["Cape May, NJ", "Pearl Harbor, HI", "Lewes, DE", "Sandy Hook, NJ"])
        }
		
    }
}
