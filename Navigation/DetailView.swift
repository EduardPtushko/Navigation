//
//  DetailView.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Grid(alignment: .leading) {
                GridRow {
                    Text(movie.name)
                    Image(systemName: movie.isMovieOfTheDay ?  "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .gridColumnAlignment(.trailing)
                    
                }
                Divider()
                GridRow {
                    Text("\(movie.year)")
                }
                Divider()
                
            }
            
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.sampleData[0])
    }
}



