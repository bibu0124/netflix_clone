//
//  MovieDetailView.swift
//  netFlixClone
//
//  Created by duynt0124 on 05/09/2023.
//

import SwiftUI
struct MovieDetailView: View {
    @ObservedObject var movie: MovieViewModel
    //@State private var isOnWatchlist = false

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                Image(uiImage: movie.image)
                    .resizable()
                    .frame(width: 100, height: 150)
                VStack(alignment: .leading){
                    HStack{
                        Text(movie.title)
                            .font(.system(size: 20))
                            .bold()
                            .padding()
                        Spacer()
                        Text(movie.rating)
                    }
                    Button(action: {
                        movie.isOnWatchlist.toggle()
                    }) {
                        Text(movie.isOnWatchlist ? "Remove from Watchlist" : "Add to Watchlist")
                            .padding()
                
                            
                    }
                    Button(action: {
                        movie.isOnWatchlist.toggle()
                    }) {
                        Text("Watch Trailer")
                        .padding()
                        
                        .border(Color.black)
                        .cornerRadius(10)
                        
                    }
                }
                
            }
            
            Divider()
            VStack{
                HStack{
                    Text("Short description")
                        .bold()
                    Spacer()
                }.padding(.top)
                
                Text(movie.description)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
            }
            Divider()
            VStack{
                HStack{
                    Text("Details")
                        .bold()
                    Spacer()
                }.padding(.top)
            }
            HStack{
                VStack(alignment: .trailing){
                    Text("Genre:")
                    Text("Release Date:")
                }.bold()
                VStack(alignment: .leading){
                    Text(movie.genre)
                    Text(movie.releasedDate)
                }.foregroundColor(.gray)
            }
            .padding()
            
            

            
            Spacer()
        }.padding(.horizontal)
    }
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MovieViewModel(
            title: "Tenet",
            description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
            rating: 7.8,
            duration: "2h 30min",
            genre: "Action, Sci-Fi",
            releasedDate: "3 September 2020",
            trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo", image: #imageLiteral(resourceName: "Tenet.png")
        ))
    }
}
