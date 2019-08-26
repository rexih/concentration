//
//  ViewController.swift
//  concentration
//
//  Created by 黄文瑞 on 2019/8/25.
//  Copyright © 2019 rexih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let dataSet = ["👽","🎃","🎃","👽"]
    
    var flipCount = 0 {
        didSet {
            counter.text = "Flip Count: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet var cards: [UIButton]!
    
    
    private lazy var model = Concentration(cards.count/2)
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        
        
        
//        let index:Int? = cards.firstIndex(of: sender)
        flipCount += 1
        if let index = cards.firstIndex(of: sender) {
//            flipCard(withEmoji:dataSet[index], on: sender)
            
            model.chooseCard(at: index)
            
            for tmp in model.cards.indices {
                let card = model.cards[tmp]
                if card.isMatched {
                    cards[tmp].setTitle("", for:UIControl.State.normal)
                    cards[tmp].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                } else if card.isFaceUp {
                    cards[tmp].setTitle(getEmoji(id: card.id), for: UIControl.State.normal)
                    cards[tmp].backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                } else {
                    cards[tmp].setTitle("", for:UIControl.State.normal)
                    cards[tmp].backgroundColor=#colorLiteral(red: 1, green: 0.72328794, blue: 0.1564150155, alpha: 1)
                }
            }
        }
    }
    
    var emojis = ["👹","👻","👽","😈","🥕","🌞","🐸","🐽","🙀"]
    var emojiDic = [Int:String]()
    
    func getEmoji(id:Int) -> String {
        var emoji = emojiDic[id]
        
        if nil == emoji, emojis.count > 0 {
            let index = arc4random_uniform(UInt32(emojis.count))
            emoji = emojis.remove(at: Int(index))
            emojiDic[id] = emoji
        }
        return emoji ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func flipCard(withEmoji emoji:String,on button:UIButton){
        
        if (button.currentTitle == emoji) {
            // front to back
            button.setTitle("", for:UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 0.72328794, blue: 0.1564150155, alpha: 1)
        } else {
            // back to front
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
}


