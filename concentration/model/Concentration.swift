//
//  Concentration.swift
//  concentration
//
//  Created by 黄文瑞 on 2019/8/26.
//  Copyright © 2019 rexih. All rights reserved.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var indexOfFaceUp:Int? = nil
    
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched {
            if let matchedIndex = indexOfFaceUp, matchedIndex != index {
                if (cards[index].id == cards[matchedIndex].id) {
                    cards[index].isMatched = true
                    cards[matchedIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfFaceUp = nil
            } else {
                indexOfFaceUp = index
                for tmp in cards.indices {
                    cards[tmp].isFaceUp = false
                }
                cards[index].isFaceUp = true
            }
        }
        
        
    }
    
    
    init(_ numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card,card]
        }
        // shuffle
        
        for _ in 1...1000 {
            for index in cards.indices {
                let forSwapIndex = Int(arc4random_uniform(UInt32(cards.count)))
                let tmp = cards[index]
                cards[index] = cards[forSwapIndex]
                cards[forSwapIndex] = tmp
            }
        }
        
        
    }
    
    
}
