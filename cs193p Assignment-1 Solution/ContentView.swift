//
//  ContentView.swift
//  Cs193p Assignment-1
//
//  Created on 06/07/23.
//

import SwiftUI

struct ContentView: View {
    
    let sportsEmojis: [String] = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️"
    ]
    
    let transportEmojis: [String] = ["✈️", "🚘", "🚎", "🚕", "🚁", "🛵", "🚲", "🚅", "🛺", "🛴", "🚢", "🚜", "🚚", "🚒", "🏎️"
    ]
    
    let facesEmojis: [String] = ["🤣", "🥺", "😇", "😅", "😫", "😏", "🥶", "🥵", "😡", "🤯", "🤗", "😭",
                                 "😎", "🤓"
    ]
    
    let themeNames = ["Sports", "Transport", "Faces"]
    let themeImages = ["figure.badminton", "car.rear", "face.smiling"]
    let deviceWidth = (UIScreen.main.bounds.width - 18)/4
    
//    currentEmojis holds the default values
    @State var currentEmojis: [String] = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️"
    ]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 64, maximum: deviceWidth)),
                    GridItem(.flexible(minimum: 64, maximum: deviceWidth)),
                    GridItem(.flexible(minimum: 64, maximum: deviceWidth)),
                    GridItem(.flexible(minimum: 64, maximum: deviceWidth))
                ]) {
                    ForEach(currentEmojis[0..<currentEmojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    currentEmojis = sportsEmojis.shuffled()
                } label: {
                    ThemeView(themeImage: themeImages[0], themeName: themeNames[0])
                }
                Spacer()
                Button {
                    currentEmojis = transportEmojis.shuffled()
                } label: {
                    ThemeView(themeImage: themeImages[1], themeName: themeNames[1])
                }
                Spacer()
                Button {
                    currentEmojis = facesEmojis.shuffled()
                } label: {
                    ThemeView(themeImage: themeImages[2], themeName: themeNames[2])
                }
            }
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15)
                    .fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.system(size: 64))
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ThemeView: View {
    
    let themeImage: String
    let themeName: String
    
    var body: some View {
        VStack {
            Image(systemName: themeImage)
                .font(.system(size: 24))
                .foregroundColor(.accentColor)
            
            Text(themeName)
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
