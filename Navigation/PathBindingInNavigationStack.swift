//
//  PathBindingInNavigationStack.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

struct PathBindingInNavigationStack: View {
    @State private var path: [Movie] = []
    
    let movies = [Movie(name: "Lord of the Rings", year: 2001, isMovieOfTheDay: true), Movie(name: "Superman", year: 2010), Movie(name: "Spiderman", year: 2012), Movie(name: "Batman", year: 2016)]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List(movies) { movie in
                    NavigationLink(movie.name, value: movie)
                }
                Button("Show Featured Movie") {
                    guard let featuredMove = movies.first(where: { $0.isMovieOfTheDay})  else { return }
                    path = [featuredMove]
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movie: movie)
            }
            .navigationTitle("Movies")
        }
    }
}

struct PathBindingInNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        PathBindingInNavigationStack()
    }
}

