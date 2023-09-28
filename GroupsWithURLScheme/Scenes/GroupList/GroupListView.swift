//
//  GroupListView.swift
//  GroupsWithURLScheme
//
//  Created by Gabriela Bezerra on 27/09/23.
//

import SwiftUI

struct GroupListView: View {
    
    @StateObject var viewModel = GroupListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.groups) { group in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(group.name)
                                Text("Members: \(group.members.joined(separator: ", "))")
                                    .font(.caption)
                            }
                            Spacer()
                            Button {
                                UIPasteboard.general.string = "groupsapp://enter?id=\(group.id)"
                                viewModel.linkWasCopied = true
                            } label: {
                                Image(systemName: "square.and.arrow.up.circle")
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(.insetGrouped)
             
                CopyToClipboardMessageView(enabled: $viewModel.linkWasCopied)
            }
            .navigationTitle("Groups")
        }
        .sheet(isPresented: $viewModel.showAddMemberToGroup) {
            if let id = viewModel.groupIDToAddMember,
               let selectedGroup = $viewModel.groups.first(where: { $0.id == id }) {
                AddMemberView(selectedGroup: selectedGroup)
            }
        }
        .onOpenURL { url in
            viewModel.handle(url: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}
