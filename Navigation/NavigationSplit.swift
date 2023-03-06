//
//  NavigationSplit.swift
//  Navigation
//
//  Created by Eduard on 06.03.2023.
//

import SwiftUI


struct NavigationSplit: View {
    @State private var selectedGenre: Genre?
    @State private var selectedMovie: Movie?
    
    let movies = [Movie(name: "Superman", year: 2011, genre: .action), Movie(name: "28 Days Later", year: 2010, genre: .horror), Movie(name: "World War Z", year: 2010, genre: .horror), Movie(name: "Finding Nemo", year: 2010, genre: .kids)]
    let columns: [GridItem] = [.init(.fixed(400)), .init(.fixed(400))]
    
    var body: some View {
        NavigationSplitView {
            List(Genre.allCases, id: \.self, selection: $selectedGenre) { genre in
                NavigationLink(genre.rawValue, value: genre)
            }
            .navigationTitle("Genres")
        } content: {
            let filteredMovies = movies.filter { $0.genre == selectedGenre}
            List(filteredMovies, selection: $selectedMovie) {movie in
                NavigationLink(movie.name, value: movie)
            }
            .navigationTitle(selectedGenre?.rawValue ?? "Movies")
            
        } detail: {
            
            VStack{
                Text(selectedMovie?.name ?? "")
                
                
            }
            .navigationTitle(selectedMovie?.name ?? "")
            .frame(width: 200, height: 200)
            .foregroundColor(.white)
            .background(Color.gray)
            
            
        }
    }
    
    private func showMovieOfTheDay() {
        guard let movieOfTheDay = movies.first(where: { $0.isMovieOfTheDay})  else { return }
        selectedMovie  =  movieOfTheDay
    }
}

struct NavigationSplit_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplit()
    }
}
