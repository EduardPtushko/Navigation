//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    let movies = [Movie(name: "Lord of the Rings", year: 2001), Movie(name: "Superman", year: 2010), Movie(name: "Spiderman", year: 2012), Movie(name: "Batman", year: 2016)]
    
    var body: some View {
        NavigationStack {
            VStack{
                List(movies) { movie in
                    NavigationLink("\(movie.name)", value: movie)
                }
                .navigationDestination(for: Movie.self) { value  in
                    Text("\(value.name)")
                }
                VStack{
                    NavigationLink("Link 1", value: "Hello World!")
                    NavigationLink("Link 2", value: 100)
                    NavigationLink("Link 3", value: Movie(name: "Lord of Rings", year: 2001))
                }
                .navigationDestination(for: String.self) { stringValue in
                    Text(stringValue)
                }
                .navigationDestination(for: Int.self) { intValue in
                    Text("\(intValue)")
                }
                .navigationDestination(for: Movie.self) { movieValue in
                    Text(movieValue.name)
                }
            }
            
        }
        
    }
}

struct ProgrammaticNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticNavigation()
    }
}
