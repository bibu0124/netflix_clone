//
//  MovieViewModel.swift
//  netFlixClone
//
//  Created by duynt0124 on 05/09/2023.
//

import Foundation
import UIKit

class MovieViewModel: Identifiable, ObservableObject {
    let id = UUID()
    let title: String
    let description: String
    let rating: String
    let duration: String
    let genre: String
    let releasedDate: String
    let trailerLink: String
    let image: UIImage
    @Published var isOnWatchlist: Bool

    init(title: String, description: String, rating: Double, duration: String, genre: String, releasedDate: String, trailerLink: String, image: UIImage) {
        self.title = title
        self.description = description
        self.rating = "\(rating)/10"
        self.duration = "Duration: \(duration)"
        self.genre = "\(genre)"
        self.releasedDate = "\(releasedDate)"
        self.trailerLink = trailerLink
        self.isOnWatchlist = false
        self.image = image
    }
}
