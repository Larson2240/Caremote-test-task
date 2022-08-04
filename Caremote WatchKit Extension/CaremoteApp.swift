//
//  CaremoteApp.swift
//  Caremote WatchKit Extension
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import SwiftUI

@main
struct CaremoteApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
