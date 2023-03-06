//
//  Movie.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import Foundation

enum Genre: String, Hashable, CaseIterable {
    case action = "Action"
    case horror = "Horror"
    case fiction = "Fiction"
    case kids = "Kids"
}

struct Movie: Hashable, Identifiable {
    let id: UUID
    let name: String
    let year: Int
    let isMovieOfTheDay: Bool
    let genre: Genre?
    
    init(id: UUID = UUID(), name: String, year: Int, isMovieOfTheDay: Bool = false, genre: Genre? = nil) {
        self.id = id
        self.name = name
        self.year = year
        self.isMovieOfTheDay = isMovieOfTheDay
        self.genre = genre
    }
}

extension Movie {
    static let sampleData = [
        Movie(name: "Lord of the Rings", year: 2001, isMovieOfTheDay: true),
        Movie(name: "Superman", year: 2010), Movie(name: "Spiderman", year: 2012),
        Movie(name: "Batman", year: 2016)
    ]
}
