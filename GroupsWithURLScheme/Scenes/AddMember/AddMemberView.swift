//
//  AddMemberView.swift
//  GroupsWithURLScheme
//
//  Created by Gabriela Bezerra on 28/09/23.
//

import Foundation
import SwiftUI

struct AddMemberView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedGroup: Group
    @State var memberName: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Member info") {
                    TextField("Name", text: $memberName)
                }
            }
            .navigationTitle("Enter \(selectedGroup.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        selectedGroup.members.append(memberName)
                        dismiss()
                    }
                    .bold()
                    .disabled(memberName.isEmpty)
                }
            }
        }
    }
}

struct AddMemberToExistingGroupView_Previews: PreviewProvider {
    
    @State static var group: Group = Group(id: "4321", name: "Coffee & Toast", members: ["Jane"])
    
    static var previews: some View {
        Text("AAA")
            .sheet(isPresented: .constant(true)) {
                AddMemberView(selectedGroup: $group)
            }
    }
}
