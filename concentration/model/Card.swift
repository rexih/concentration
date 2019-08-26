//
//  Card.swift
//  concentration
//
//  Created by 黄文瑞 on 2019/8/26.
//  Copyright © 2019 rexih. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id:Int
    
    static var genedId = 0
    
    static func genUniqueId() -> Int{
        genedId += 1
        return genedId
    }
    
    init(){
        id = Card.genUniqueId()
    }
    
}
