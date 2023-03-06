//
//  AppState.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import Foundation

final class AppState: ObservableObject {
    @Published var path: [Movie] = []
}
