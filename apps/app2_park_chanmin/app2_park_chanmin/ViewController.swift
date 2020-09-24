//
//  ViewController.swift
//  app2_park_chanmin
//
//  Created by David Park on 9/17/20.
//  Copyright © 2020 Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultBoard()
    }
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    enum BlockState: Int {
        case empty
        case playerOne
        case playerTwo
    }
    
    var playerOneScoreCount = 0 {
        willSet {
            playerOneScore.text = "Player 1 Score: \(newValue)"
        }
    }
    
    var playerTwoScoreCount = 0 {
        willSet {
            playerTwoScore.text = "Player 2 Score: \(newValue)"
        }
    }
    
    var isCurrPlayerOne = true
    var gameStop = false
    
    var winningConditions: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    
    var blockStates: [BlockState] = Array(repeating: BlockState.empty, count: 9)
    
    func defaultBoard() {
        let buttonImage = UIImage(named: "mark-none")?.withRenderingMode(.alwaysTemplate)
        for button in buttons {
            button.setImage(buttonImage, for: .normal)
            button.tintColor = .systemBlue
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        defaultBoard()
        isCurrPlayerOne = true
        gameStop = false
        blockStates = Array(repeating: BlockState.empty, count: 9)
        gameStatus.text = "Player 1's Turn"
        gameStatus.textColor = .black
    }
    
    func buttonFunc(_ sender: UIButton) {
        if !gameStop {
            let currBlock = sender.tag
            
            // if button clicked is empty
            if blockStates[currBlock] == BlockState.empty {
                if (isCurrPlayerOne) {
                    sender.setImage(UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    blockStates[currBlock] = BlockState.playerOne
                } else {
                    sender.setImage(UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate), for: .normal)
                    blockStates[currBlock] = BlockState.playerTwo
                }
                
                // check for winner and if there is one
                if let winningCon = checkWinner() {
                    gameStop = true
                    // update score and status
                    if isCurrPlayerOne {
                        gameStatus.text = "Player 1 Wins!"
                        playerOneScoreCount += 1
                    } else {
                        gameStatus.text = "Player 2 Wins!"
                        playerTwoScoreCount += 1
                    }
                    gameStatus.textColor = .systemGreen
                    for winningButton in winningCon {
                        let button = buttons[winningButton]
                        button.tintColor = .systemYellow
                    }
                // check for draw otherwise
                } else if checkDraw() {
                    gameStop = true
                    gameStatus.text = "Draw"
                    for button in buttons {
                        button.tintColor = .systemGray
                    }
                // else continue
                } else {
                    gameStatus.text = isCurrPlayerOne ? "Player 2's Turn" : "Player 1's Turn"
                    isCurrPlayerOne = !isCurrPlayerOne
                }
                
            }
        }
    }
    
    func checkDraw() -> Bool {
        for block in blockStates {
            if block == BlockState.empty {
                return false
            }
        }
        return true
    }
    
    func checkWinner() -> ([Int])? {
        for winningCon in winningConditions {
            let posOne = winningCon[0]
            let posTwo = winningCon[1]
            let posThree = winningCon[2]
            if blockStates[posOne].rawValue == blockStates[posTwo].rawValue && blockStates[posTwo].rawValue ==  blockStates[posThree].rawValue && blockStates[posOne] != BlockState.empty {
                return winningCon
            }
        }
        return nil
    }

    @IBAction func clickButtonOne(_ sender: UIButton) {
        buttonFunc(sender)
    }
    
    @IBAction func clickButtonTwo(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonThree(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonFour(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonFive(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonSix(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonSeven(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonEight(_ sender: UIButton) {
        buttonFunc(sender)
    }
    @IBAction func clickButtonNine(_ sender: UIButton) {
        buttonFunc(sender)
    }
}

