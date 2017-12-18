//
//  ViewController.swift
//  Jin Game
//
//  Created by wm1 on 2017-11-13.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bOne: UIImageView!
    @IBOutlet weak var bTwo: UIImageView!
    @IBOutlet weak var bThree: UIImageView!
    @IBOutlet weak var bFour: UIImageView!
    @IBOutlet weak var bFive: UIImageView!
    @IBOutlet weak var bSix: UIImageView!
    @IBOutlet weak var bSeven: UIImageView!
    @IBOutlet weak var bEight: UIImageView!
    @IBOutlet weak var bNine: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    @IBAction func start(_ sender: Any) {
        if (startButton.title(for: []) == "Restart the Game!") {
            bOne.image = UIImage(named: "blank.gif")
            tOne = true
            bTwo.image = UIImage(named: "blank.gif")
            tTwo = true
            bThree.image = UIImage(named: "blank.gif")
            tThree = true
            bFour.image = UIImage(named: "blank.gif")
            tFour = true
            bFive.image = UIImage(named: "blank.gif")
            tFive = true
            bSix.image = UIImage(named: "blank.gif")
            tSix = true
            bSeven.image = UIImage(named: "blank.gif")
            tSeven = true
            bEight.image = UIImage(named: "blank.gif")
            tEight = true
            bNine.image = UIImage(named: "blank.gif")
            tNine = true
        } else {
            background.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                self.background.image = UIImage(named: "tic tac toe.jpg")
                self.background.alpha = 1
            })
            startButton.setTitle("Restart the Game!", for: [])
        }
    }
    
    @IBOutlet weak var startButton: UIButton!
    var imageOne = UIImage(named: "diamond.gif")
    var imageTwo = UIImage(named: "heart.gif")
    var isOne = true
    
    var tOne = true
    var tTwo = true
    var tThree = true
    var tFour = true
    var tFive = true
    var tSix = true
    var tSeven = true
    var tEight = true
    var tNine = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkRow(imageC: UIImageView) -> Bool {
        if (imageC == bOne || imageC == bTwo || imageC == bThree) {
            let first = bOne.image
            let second = bTwo.image
            let third = bThree.image
            if (first == second && second == third) {
                return true
            }
        }
        if (imageC == bFour || imageC == bFive || imageC == bSix) {
            let first = bFour.image
            let second = bFive.image
            let third = bSix.image
            if (first == second && second == third) {
                return true
            }
        }
        if (imageC == bSeven || imageC == bEight || imageC == bNine) {
            let first = bSeven.image
            let second = bEight.image
            let third = bNine.image
            if (first == second && second == third) {
                return true
            }
        }
        return false
    }
    
    func checkCol(imageC: UIImageView) -> Bool {
        if (imageC == bOne || imageC == bFour || imageC == bSeven) {
            let first = bOne.image
            let second = bFour.image
            let third = bSeven.image
            if (first == second && second == third) {
                return true
            }
        }
        if (imageC == bTwo || imageC == bFive || imageC == bEight) {
            let first = bTwo.image
            let second = bFive.image
            let third = bEight.image
            if (first == second && second == third) {
                return true
            }
        }
        if (imageC == bThree || imageC == bSix || imageC == bNine) {
            let first = bThree.image
            let second = bSix.image
            let third = bNine.image
            if (first == second && second == third) {
                return true
            }
        }
        return false
    }
    
    func checkSide(imageC: UIImageView) -> Bool {
        if (imageC == bOne || imageC == bFive || imageC == bNine) {
            let first = bOne.image
            let second = bFive.image
            let third = bNine.image
            if (first == second && second == third) {
                return true
            }
        }
        if (imageC == bThree || imageC == bFive || imageC == bSeven) {
            let first = bThree.image
            let second = bFive.image
            let third = bSeven.image
            if (first == second && second == third) {
                return true
            }
        }
        return false
    }
    
    func endGame(value: Int) {
        tOne = false
        tTwo = false
        tThree = false
        tFour = false
        tFive = false
        tSix = false
        tSeven = false
        tEight = false
        tNine = false
        if (value == 1) {
            let alert = UIAlertView(title: "Diamond Wins!",
                                    message: "This game has ended.\r\n To play again, please tap on the \"Restart the Game!\" button.", delegate: nil, cancelButtonTitle: "Ok")
            alert.delegate = self
            alert.show()
        } else {
            let alert = UIAlertView(title: "Heart Wins!",
                                    message: "This game has ended.\r\n To play again, please tap on the \"Restart the Game!\" button.", delegate: nil, cancelButtonTitle: "Ok")
            alert.delegate = self
            alert.show()
        }
    }
    
    func checkWin(imageC: UIImageView) {
        var val = 0
        let rowCheck = checkRow(imageC: imageC)
        let colCheck = checkCol(imageC: imageC)
        let sideCheck = checkSide(imageC: imageC)
        if (rowCheck || colCheck || sideCheck) {
            if (imageC.image == imageOne) {
                print("Diamond Win!")
                val = 1
            } else {
                print("Heart Win!")
                val = 2
            }
            endGame(value: val)
        }
    }

    func fill(imageChoose: UIImageView) {
        if (isOne) {
            imageChoose.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                imageChoose.image = self.imageOne
                imageChoose.alpha = 1
            })
            isOne = false
        } else {
            imageChoose.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                imageChoose.image = self.imageTwo
                imageChoose.alpha = 1
            })
            isOne = true
        }
    }
    
    @IBAction func one(_ sender: Any) {
        if (tOne) {
            fill(imageChoose: bOne)
            checkWin(imageC: bOne)
        }
        tOne = false
    }
    
    @IBAction func two(_ sender: Any) {
        if (tTwo) {
            fill(imageChoose: bTwo)
            checkWin(imageC: bTwo)
        }
        tTwo = false
    }
    
    @IBAction func three(_ sender: Any) {
        if (tThree) {
            fill(imageChoose: bThree)
            checkWin(imageC: bThree)
        }
        tThree = false
    }
    
    @IBAction func four(_ sender: Any) {
        if (tFour) {
            fill(imageChoose: bFour)
            checkWin(imageC: bFour)
        }
        tFour = false
    }
    
    @IBAction func five(_ sender: Any) {
        if (tFive) {
            fill(imageChoose: bFive)
            checkWin(imageC: bFive)
        }
        tFive = false
    }
    
    @IBAction func six(_ sender: Any) {
        if (tSix) {
            fill(imageChoose: bSix)
            checkWin(imageC: bSix)
        }
        tSix = false
    }
    
    @IBAction func seven(_ sender: Any) {
        if (tSeven) {
            fill(imageChoose: bSeven)
            checkWin(imageC: bSeven)
        }
        tSeven = false
    }
    
    @IBAction func eight(_ sender: Any) {
        if (tEight) {
            fill(imageChoose: bEight)
            checkWin(imageC: bEight)
        }
        tEight = false
    }
    
    @IBAction func nine(_ sender: Any) {
        if (tNine) {
            fill(imageChoose: bNine)
            checkWin(imageC: bNine)
        }
        tNine = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

