//
//  MovieListView.swift
//  netFlixClone
//
//  Created by duynt0124 on 05/09/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel = MovieListViewModel()
    @State private var sortType: SortType = .byReleaseDate
    @State private var showAlert = false
    
    
    
    var body: some View {
        NavigationView {
            List(movieListViewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRowView(movie: movie)
                }
            }
            .navigationBarTitle("Movie")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sort"){
                        self.showAlert.toggle()
                    }.font(.callout)
                        .foregroundColor(.black)
                }
            }
        }.confirmationDialog("", isPresented: $showAlert, titleVisibility: .hidden) {
            Button("Title") {
                self.movieListViewModel.sortByDate()
            }
            Button("Release Date") {
                self.movieListViewModel.sortByTitle()
            }
        }
//        }.alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("Sort By"),
//                message: Text("Select a sorting criteria"),
//                primaryButton: .default(Text("Title")) {
//                    self.movieListViewModel.sortByDate()
//                },
//                secondaryButton: .default(Text("Release Date")) {
//                    self.movieListViewModel.sortByTitle()
//                },
//                dismissButton: .cancel()
//            )
//        }
    }
}

struct MovieRowView: View {
    @ObservedObject var movie: MovieViewModel

    var body: some View {
        HStack {
            Image(uiImage: movie.image)
                .resizable()
                .frame(width: 100, height: 150)
            VStack(alignment: .leading){
                Text(movie.title)
                    .font(.title3)
                    .bold()
                Text("\(movie.duration) - \(movie.genre)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.bottom)
                if movie.isOnWatchlist {
                    Text("ON MY WATCHLIST")
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.gray)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
