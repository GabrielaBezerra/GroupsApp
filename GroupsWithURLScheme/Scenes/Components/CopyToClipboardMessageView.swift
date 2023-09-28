//
//  CopyToClipboardMessageView.swift
//  GroupsWithURLScheme
//
//  Created by Gabriela Bezerra on 28/09/23.
//

import Foundation
import SwiftUI

struct CopyToClipboardMessageView: View {
    
    @Binding private var enabled: Bool
    @State private var copyMessageOpacity: Double = 0
    
    init(enabled: Binding<Bool>) {
        self._enabled = enabled
    }
    
    var body: some View {
        Text("Copied to clipboard")
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor.opacity(0.5))
            .cornerRadius(11)
            .opacity(copyMessageOpacity)
            .animation(.easeInOut(duration: 0.5), value: copyMessageOpacity)
            .onChange(of: enabled) { newValue in
                if newValue {
                    Task {
                        copyMessageOpacity = 1
                        try? await Task.sleep(for: .seconds(2))
                        copyMessageOpacity = 0
                        enabled = false
                    }
                }
            }
    }
    
}
