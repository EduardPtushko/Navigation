//
//  GlobalPathStackView.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

struct GlobalPathStackView: View {
    @EnvironmentObject  var appState: AppState
    
    let movies = [Movie(name: "Lord of the Rings", year: 2001, isMovieOfTheDay: true), Movie(name: "Superman", year: 2010), Movie(name: "Spiderman", year: 2012), Movie(name: "Batman", year: 2016)]
    
    var body: some View {
        NavigationStack(path: $appState.path) {
            VStack {
                List(movies) { movie in
                    NavigationLink(movie.name, value: movie)
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movie: movie)
            }
            .navigationTitle("Movies")
        }
    }
}

struct GlobalPathStackView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalPathStackView()
            .environmentObject(AppState())
    }
}
