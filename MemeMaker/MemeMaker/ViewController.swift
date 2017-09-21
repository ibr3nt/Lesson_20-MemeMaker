//
//  ViewController.swift
//  MemeMaker
//
//  Created by iBrent on 9/19/17.
//  Copyright © 2017 iBrent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    var topChoices = [CaptionChoice]()
    var bottomChoices = [CaptionChoice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let coolChoice = CaptionChoice(emoji: "🕶", caption: "You know what's cool?")
        let madChoice = CaptionChoice(emoji: "💥", caption: "You know what makes me mad?")
        let loveChoice = CaptionChoice(emoji: "💕", caption: "You know what I love?")
        
        topChoices = [coolChoice, madChoice, loveChoice]
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        let catChoice = CaptionChoice(emoji: "🐱", caption: "Cats wearing hats")
        let dogChoice = CaptionChoice(emoji: "🐶", caption: "Dogs carrying logs")
        let monkeyChoice = CaptionChoice(emoji: "🐵", caption: "Monkeys being funky")
        
        bottomChoices = [catChoice, dogChoice, monkeyChoice]
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateLabels() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
    }
    
    @IBAction func choiceSelected(_ sender: Any) {
        updateLabels()
    }
    
}

