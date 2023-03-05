//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ivan Behichev on 20.02.2023.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    func chose(_ card : Card) {
        
    }
    
    init(numberPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    struct Theme {
        var name: String
        var emojiSet: String
        var numberOfPairs: Int
    }
}
