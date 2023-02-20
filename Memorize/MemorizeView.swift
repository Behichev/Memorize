//
//  MemorizeView.swift
//  Memorize
//
//  Created by Ivan Behichev on 03.02.2023.
//

import SwiftUI

struct MemorizeView: View {
    @State private var emojis = ["🚗","🏎️","🚕","🚓","🚊","🛞","🚲","🚚","🚒","🚑","🚎","🚌","🚙"]
    @State private var emojiCount = 8
    @State private var selectedIndex = 0
    
    private let emojisEmoji = [
        "😃","🥰","😄","🥳","😝","😙","🧐","🥲","😡","😱","😰","🤪","😏","🫥","😵"
    ]
    
    private let vehichelEmoji = [
        "🚗","🏎️","🚕","🚓","🚊","🛞","🚲","🚚","🚒","🚑","🚎","🚌","🚙"
    ]
    private let foodEmojis = [
        "🍔","🍕","🍟","🍗","🍣","🌮","🥩","🍤"
    ]
    private let layout = [
        GridItem(.adaptive(minimum: 65))
    ]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.orange)
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    ForEach(emojis[0..<emojiCount], id: \.self) { item in
                        CardView(content: item)
                            .aspectRatio(2/3,contentMode: .fit)
                            .padding(.vertical, 1)
                    }
                })
            }
            .foregroundColor(.orange)
            Spacer()
            HStack {
                emojiThemeButton
                Spacer(minLength: 8)
                emojiVehiclesButton
                Spacer(minLength: 8)
                foodEmojiButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var emojiThemeButton: some View {
        Button {
            selectedIndex = 1
            emojiCount = emojisEmoji.count
            emojis = emojisEmoji.shuffled()
        } label: {
            VStack {
                Image(systemName: "face.smiling.inverse")
                    .renderingMode(.original)
                Text("emoji")
                    .font(.subheadline)
            }
            .foregroundColor(selectedIndex == 1 ? .orange : .blue)
        }
    }
    
    var emojiVehiclesButton: some View {
        Button {
            selectedIndex = 0
            emojiCount = vehichelEmoji.count
            emojis = vehichelEmoji.shuffled()
        } label: {
            VStack {
                Image(systemName: "car.circle")
                Text("vehicles")
                    .font(.subheadline)
            }
            .foregroundColor(selectedIndex == 0 ? .orange : .blue)
        }
    }
    
    var foodEmojiButton: some View {
        Button {
            selectedIndex = 2
            emojiCount = foodEmojis.count
            emojis = foodEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "fork.knife.circle")
                Text("food")
                    .font(.subheadline)
            }
            .foregroundColor(selectedIndex == 2 ? .orange : .blue)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
    }
}
