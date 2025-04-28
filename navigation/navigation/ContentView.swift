//
//  ContentView.swift
//  navigation
//
//  Created by M Naufal Badruttamam on 28/04/25.
//

import SwiftUI

struct ContentView: View {
    var platforms: [Platform] = [
        .init(name: "Xbox", imageName: "xbox.logo", color: .green),
        .init(name: "Playstation", imageName: "playstation.logo", color: .indigo),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .mint)
    ]
    
    var games: [Game] = [
        .init(name: "Mobile Legend", rating: 12),
        .init(name: "Clash of Clans", rating: 20),
        .init(name: "PUBG", rating: 13),
        .init(name: "Call of Duty", rating: 15),
        .init(name: "Grand Theft Auto V", rating: 18)
    ]

    
    var body: some View {
        NavigationStack {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming platform")
            .navigationDestination(for: Platform.self) {
                platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                 }
            }
            .navigationDestination(for: Game.self) {
                game in
                Text ("\(game.name) has a rating of \(game.rating)")
                    .font(.largeTitle.bold())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: Int
}
