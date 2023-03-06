//
//  NavigationPath.swift
//  Navigation
//
//  Created by Eduard on 06.03.2023.
//

import SwiftUI

struct NavigationPathView: View {
    let movies = [Movie(name: "Lord of the Rings", year: 2000), Movie(name: "Batman", year: 2001), Movie(name: "Spiderman", year: 2010)]
    let actors = [Actor(name: "Tom Hanks"), Actor(name: "Kate Winslet"), Actor(name: "Bill Murray")]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Go to a random movie") {
                    guard let randomMovie = movies.randomElement() else { return }
                    path.append(randomMovie)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: Movie.self) { movie in
                VStack {
                    Text(movie.name)
                    Button("Go to a random actor"){
                        guard let randomActor = actors.randomElement() else { return }
                        path.append(randomActor)
                    }
                }
                .navigationDestination(for: Actor.self) { actor in
                    Text(actor.name)
                    Button {
                        path.removeLast(path.count)
                    } label: {
                        Text("Go to Root")
                    }
                }
            }
            
        }
    }
}

struct NavigationPathView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPathView()
    }
}
