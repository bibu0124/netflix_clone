//
//  MovieDetailView.swift
//  netFlixClone
//
//  Created by duynt0124 on 05/09/2023.
//

import SwiftUI
import AVKit
struct MovieDetailView: View {
    
    
    
    @ObservedObject var movie: MovieViewModel
    @State private var isOnWatchlist = false
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack(){
            Divider()
            VStack(alignment: .leading) {
                
                HStack{
                    Image(uiImage: movie.image)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(5)
                        .shadow(color: .gray,
                                radius: 1,
                                x: 0, // Horizontal offset
                                y: 5)
                    VStack(alignment: .leading){
                        HStack{
                            Text(movie.title)
                                .font(.system(size: 20))
                                .bold()
                                .padding()
                            Spacer()
                            Text(movie.rating).bold() + Text("/10").foregroundColor(.gray).font(.system(size: 14))
                        }
                        Button(action: {
                            movie.isOnWatchlist.toggle()
                        }) {
                            Text(movie.isOnWatchlist ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST")
                                .padding()
                                
                                .frame(height: 2)
                                .font(.system(size: 11))
                                .bold()
                                .padding()
                                .foregroundColor(.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.white, lineWidth: 2)
                                )
                                
                        }
                        .background(Color("bgButton"))
                        .cornerRadius(20)
                        
                        
                        Button(action: {
                            print("Click play \(movie.trailerLink)")
                            if let videoURL = URL(string: movie.trailerLink) {
                                self.player = AVPlayer(url: videoURL)
                                let playerViewController = AVPlayerViewController()
                                playerViewController.player = player
                                UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true, completion: {
                                    self.player?.play()
                                })

                                // Add error handling
                                NotificationCenter.default.addObserver(forName: .AVPlayerItemFailedToPlayToEndTime, object: player?.currentItem, queue: nil) { (_) in
                                    if let error = self.player?.currentItem?.error {
                                        print("Error: \(error.localizedDescription)")
                                    }
                                }
                            }
                        }) {
                            Text("Watch Trailer")
                            .padding()
                            .frame(height: 2)
                            .font(.system(size: 14))
                            .bold()
                            .padding()
                            .foregroundColor(Color("title_darkmode"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color("title_darkmode"), lineWidth: 2)
                            )
                            
                        }
                    }
                    
                }
                .padding(.bottom)
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
                        Text(DateFormatterUtility.formatDateString(inputDateString: movie.releasedDate))
                    }.foregroundColor(.gray)
                }
                .padding()
                
                

                
                Spacer()
            }.navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
        }
        
        
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
