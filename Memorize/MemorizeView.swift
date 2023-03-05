//
//  MemorizeView.swift
//  Memorize
//
//  Created by Ivan Behichev on 03.02.2023.
//

import SwiftUI

struct MemorizeView: View {
    @State private var emojiCount = 8
    
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
        }
        .padding(.horizontal)
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
