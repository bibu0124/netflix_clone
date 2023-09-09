//
//  netFlixCloneApp.swift
//  netFlixClone
//
//  Created by duynt0124 on 05/09/2023.
//

import SwiftUI

@main
struct netFlixCloneApp: App {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(named: "bg Darkmode")
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "title_darkmode")]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "title_darkmode")]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor(named: "bg Darkmode")
        UINavigationBar.appearance().backItem?.leftBarButtonItem?.tintColor = UIColor(named: "title_darkmode")
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(named: "title_darkmode")
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
