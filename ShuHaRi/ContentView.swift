//
//  ContentView.swift
//  ShuHaRi
//
//  Created by Yuki on 2025/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "airplane")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, penguin!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
