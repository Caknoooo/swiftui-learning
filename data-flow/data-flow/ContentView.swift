//
//  ContentView.swift
//  data-flow
//
//  Created by M Naufal Badruttamam on 27/04/25.
//

import SwiftUI
import Observation

class User: ObservableObject {
    @Published var name: String
    @Published var jobTitle: String
    @Published var followerCount: Int
    @Published var bio: String
    
    init(name: String, jobTitle: String, followerCount: Int, bio: String) {
        self.name = name
        self.jobTitle = jobTitle
        self.followerCount = followerCount
        self.bio = bio
    }
}

// Versi Observation
@Observable class UserObservable {
    var name: String
    var jobTitle: String
    var followerCount: Int
    var bio: String
    
    init(name: String, jobTitle: String, followerCount: Int, bio: String) {
        self.name = name
        self.jobTitle = jobTitle
        self.followerCount = followerCount
        self.bio = bio
    }
}

struct ContentView: View {
    @StateObject var user: User = .init(name: "M Naufal Badruttamam", jobTitle: "Software Engineer", followerCount: 10, bio: "Hello, I am M Naufal Badruttamam")
    
    // Declare
//    var userObservable: UserObservable = .init(name: "Caknor", jobTitle: "Programmer", followerCount: 20, bio: "Hello World")
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(user.name).font(.title.bold())
            Text(user.jobTitle).foregroundStyle(.secondary)
            Text("\(user.followerCount) Followers")
            
            Button {
                user.followerCount += 1
            } label: {
                Text("Add Followers")
            }.buttonStyle(.borderedProminent)
                .padding(.top, 30)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
