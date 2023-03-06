//
//  ContentView.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GlobalPathStackView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppState())
    }
}
