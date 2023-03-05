//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ivan Behichev on 20.02.2023.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚗","🏎️","🚕","🚓","🚊","🛞","🚲","🚚","🚒","🚑","🚎","🚌","🚙"]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberPairsOfCard: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
