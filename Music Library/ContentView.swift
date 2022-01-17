//
//  ContentView.swift
//  Music Library
//
//  Created by administrator on 17/01/2022.
//

import SwiftUI

import SwiftUI
struct MusicLibrary: View {
    var body: some View {
        VStack {
            HeaderView()
            Divider()
                .padding()
            SongsView()
            ArtistsView()
        }
    }
}
struct MusicLibrary_Previews: PreviewProvider {
    static var previews: some View {
        MusicLibrary()
    }
}
struct HeaderView: View {
    var body: some View {
        HStack{
            ZStack{
                Rectangle()
                    .frame(width: 150, height: 200, alignment: .center)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                Text("Hassan Amer")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .opacity(0.4)
            }
            
            VStack{
                Text("Hassan Amer")
                Text("Hassan Amer")
                Text("Hassan Amer")
                Spacer()
                Text("Hassan Amer")
                HStack{
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.blue)
                        Text("Play")
                            .font(.system(size: 15))
                            .foregroundColor(.blue)
                    })
                    .padding()
                    .background(Color( red: 0.0, green: 0.0, blue: 1.0, opacity: 0.1))
                    
                    Button(action: {}, label: {
                        Image(systemName: "shuffle")
                            .foregroundColor(.blue)
                        Text("Shuffle")
                            .font(.system(size: 15))
                            .foregroundColor(.blue)
                    })
                    .padding()
                    .background(Color( red: 0.0, green: 0.0, blue: 1.0, opacity: 0.1))
                    
                }
            }
        }
    }
}
struct SongsView: View {
    var body: some View {
        List(Song.songs){
            song in
            HStack(alignment: .center){
                Image(systemName: "music.mic")
                    .frame(width: 50, height: 50)
                    .background(song.gradient)
                    .cornerRadius(10)
                Text("\(song.name)")
                Spacer()
                Text("\(song.duration)")
            }
            .frame(maxWidth: .infinity)
        }
    }
}
struct ArtistsView: View {
    var body: some View {
        VStack{
            Text("Artists View")
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding()
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(Artist.artists){
                        artist in
                        VStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(artist.randomColors)
                                    .frame(width: 50, height: 50)
                                Image(systemName: "music.mic")
                            }
                            Text("\(artist.name)")
                                .font(.system(size: 15))
                                .multilineTextAlignment(.center)
                                .frame(width: 75, alignment: .center)
                        }
                    }
                }
                .frame(height: 100)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
struct Song: Identifiable {
    let id = UUID()
    let name: String
    let duration: String
    
    // This is just an attribute that will generate a random gradient color for the song
    let gradient: LinearGradient = {
        let colors: [Color] = [.orange, .pink, .purple, .red, .yellow]
        return LinearGradient(gradient:
                                Gradient(colors: [colors.randomElement()!,
                                                  colors.randomElement()!]),
                              startPoint: .center,
                              endPoint: .topTrailing)
    }()
    
    static let songs: [Song] = [
        Song(name: "Memories Of Shadow", duration: "13:15"),
        Song(name: "Still Need June", duration: "05:12"),
        Song(name: "Calming World", duration: "01:40"),
        Song(name: "Live Screams", duration: "14:51"),
        Song(name: "Better NIGHT SPIRITS", duration: "07:38"),
        Song(name: "Tearful Eyes", duration: "07:05"),
        Song(name: "I Believe In Snooze", duration: "11:58"),
        Song(name: "Earning", duration: "07:56"),
        Song(name: "Keen Screams", duration: "15:12"),
        Song(name: "Cheerful Smiles", duration: "04:47"),
        Song(name: "Scenes In Memories Never Fade", duration: "08:40"),
        Song(name: "Sweetheart Inside Repetition", duration: "06:39"),
        Song(name: "Funny Cafe Music", duration: "11:02"),
        Song(name: "Out Of Nature Noise", duration: "08:44"),
        Song(name: "Wild Ocean", duration: "01:29"),
        Song(name: "Overjoyed by drama", duration: "08:56"),
        Song(name: "What about chills", duration: "11:44"),
        Song(name: "Unexpected Midnight", duration: "15:45"),
        Song(name: "Out Of Evening", duration: "07:52"),
        Song(name: "Memories Of Eyes", duration: "15:35"),
        Song(name: "Running Gems", duration: "12:55"),
        Song(name: "Cool Rain", duration: "13:06"),
        Song(name: "Chilled Night", duration: "02:05"),
        Song(name: "24K Paradise", duration: "05:49"),
        Song(name: "A Distilled Change", duration: "08:50"),
        Song(name: "Not Morning", duration: "09:25"),
        Song(name: "Trapped By Danger", duration: "10:34"),
        Song(name: "Blissful Brave Life", duration: "06:02"),
        Song(name: "Various Horizon", duration: "11:04")
    ]
}
struct Artist: Identifiable {
    let id = UUID()
    let name: String
    let randomColors = [Color.orange, .pink, .purple, .red, .yellow].randomElement()!
    
    static let artists: [Artist] = [
        Artist(name: "Cher Thabang"),
        Artist(name: "Selma Alondra"),
        Artist(name: "Mokhtar Mikita"),
        Artist(name: "Christabella Ruperta"),
        Artist(name: "Avianna Tycho"),
        Artist(name: "Gianna Abhinav"),
        Artist(name: "Dylan Garland"),
        Artist(name: "Shaimaa Orval"),
        Artist(name: "Christy Justin"),
        Artist(name: "Eva Irvin")
    ]
}
