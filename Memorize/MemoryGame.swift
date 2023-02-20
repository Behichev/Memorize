//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ivan Behichev on 20.02.2023.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func chose(_ card : Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
