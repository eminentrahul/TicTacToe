//
//  ViewController.swift
//  ttt
//
//  Created by Rahul Ravi Prakash on 28/09/17.
//  Copyright © 2017 Rahul Ravi Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1 //Cross will be initial player
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameActive = true

    @IBOutlet weak var label: UILabel!
    
    @IBAction func actionButton(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0 && gameActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1
            {
                sender.setImage(UIImage(named: "Cross"), for : UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought"), for : UIControlState())
                activePlayer = 1
            }
            
            for combination in winningCombination{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    gameActive = false
                    if gameState[combination[0]] == 1{
                        //Cross has won
                        //print("Cross has won the Game!")
                        label.text = "Cross has won the Game!"
                    }
                    else
                    {
                        label.text = "Nought has won the Game!"
                    }
                    
                    playAgainButton.isHidden = false
                    label.isHidden = false
                }

            }
            //Logic behind Tie Game
            gameActive = false
            for i in gameState{
                if i == 0{
                    gameActive = true
                    break
                }
            }
            if gameActive == false{
                
                label.text = "It was a Tie Game!"
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
            
        }
        
        
        
    }
    
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

