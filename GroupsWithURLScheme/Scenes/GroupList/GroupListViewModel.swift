//
//  GroupListViewModel.swift
//  GroupsWithURLScheme
//
//  Created by Gabriela Bezerra on 28/09/23.
//

import Foundation

class GroupListViewModel: ObservableObject {
    
    // Data
    @Published var groups: [Group] = [
        Group(id: "1232", name: "Mentors", members: ["Hairon", "Ajalmar", "Carol", "Gabi", "Mateus", "Elis"]),
        Group(id: "1233", name: "Swift Club", members: ["Gabi", "Mateus", "Cáren"]),
        Group(id: "1234", name: "Figma Club", members: ["Carol", "Elis", "David", "Lucas"])
    ]
    
    // Copy to clipboard state
    @Published var linkWasCopied: Bool = false
    
    // Add member states
    @Published var showAddMemberToGroup: Bool = false
    @Published var groupIDToAddMember: String?

    // Open URL handler
    func handle(url: URL) {
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
              let scheme = components.scheme, scheme == "groupsapp",
              let action = components.host,
              let params = components.queryItems else {
            print("Invalid URL or album path missing")
            return
        }
        
        switch action {
        case "enter":
            if let firstParam = params.first, let id = firstParam.value, firstParam.name == "id" {
                print("add new member to group \(id)")
                groupIDToAddMember = id
                showAddMemberToGroup = true
            }
        default:
            print("Unhandled action:", url)
        }
    }
    
}
