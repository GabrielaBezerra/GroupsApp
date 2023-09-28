//
//  GroupsWithURLSchemeApp.swift
//  GroupsWithURLScheme
//
//  Created by Gabriela Bezerra on 27/09/23.
//

// "groupsapp://groups:enter?id=1234"

import SwiftUI

@main
struct GroupsWithURLSchemeApp: App {
    var body: some Scene {
        WindowGroup {
            GroupListView()
        }
    }
}
