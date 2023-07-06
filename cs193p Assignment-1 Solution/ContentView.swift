//
//  ContentView.swift
//  Cs193p Assignment-1
//
//  Created on 06/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var Emojis: [String] = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️",
                            "✈️", "🚘", "🚎", "🚕", "🚁", "🛵", "🚲", "🚅", "🛺", "🛴", "🚢", "🚜", "🚚", "🚒", "🏎️",
                            "🤣", "🥺", "😇", "😅", "😫", "😏", "🥶", "🥵", "😡", "🤯", "🤗", "😭",
                            "😎", "🤓"
    ]
    
    @State var themeNames = ["Sports", "Transport", "Faces"]
    @State var themeImages = ["figure.badminton", "car.rear", "face.smiling"]
    @State var startPosition = 0
    @State var endPosition = 11 // inclusive
    @State var deviceWidth = (UIScreen.main.bounds.width - 18)/4
    
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
                    ForEach(Emojis[startPosition...endPosition], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    startPosition = 0
                    endPosition = 11
                } label: {
                    ThemeView(themeImage: themeImages[0], themeName: themeNames[0])
                }
                Spacer()
                Button {
                    startPosition = 12
                    endPosition = 26
                } label: {
                    ThemeView(themeImage: themeImages[1], themeName: themeNames[1])
                }
                Spacer()
                Button {
                    startPosition = 27
                    endPosition = 40
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
    
    @State var content: String = ""
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
    
    @State var themeImage = ""
    @State var themeName = ""
    
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
