//
//  ViewController.swift
//  MontyHall2
//
//  Created by Pierre-Marie Galite on 12/01/17.
//  Copyright © 2017 Pierre-Marie Galite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnDoorLeft: UIButton!
    @IBOutlet weak var btnDoorCenter: UIButton!
    @IBOutlet weak var btnDoorRight: UIButton!
    @IBOutlet weak var labelCenter: UILabel!
    
    var mode:Int = 0 // 0: Initial, 1: After first selection
    
    var shuffleDoors:[DoorEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDoors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Initialize and Randomize array of doors */
    func initDoors() {
        mode = 0
        labelCenter.text = "Choose a Door"
        let doorA = DoorEntity(initialPrize: "car")
        let doorB = DoorEntity(initialPrize: "goat")
        let doorC = DoorEntity(initialPrize: "goat")
        var doors:[DoorEntity] = []
        doors.append(doorA)
        doors.append(doorB)
        doors.append(doorC)
        shuffleDoors = doors.shuffled()
        shuffleDoors[0].initDoorImage(with: btnDoorLeft)
        shuffleDoors[1].initDoorImage(with: btnDoorCenter)
        shuffleDoors[2].initDoorImage(with: btnDoorRight)
    }
    
    /* Show another door with a wrong answer */
    func showDoorWithGoat(){
        for currentDoor in shuffleDoors{
            if(!currentDoor.isSelected && !currentDoor.isWinner){
                currentDoor.showPrize()
                break
            }
        }
        labelCenter.text = "Tap on your last choice !"
    }
    
    /* Reset every choice to false */
    func resetSelection(){
        for currentDoor in shuffleDoors{
            currentDoor.isSelected = false
        }
    }
    
    /* Show everything and check if user won */
    func showAllPrizes(){
        shuffleDoors[0].showPrize()
        shuffleDoors[1].showPrize()
        shuffleDoors[2].showPrize()
        var labelWinner = "You loose"
        for currentDoor in shuffleDoors{
            if(currentDoor.isSelected && currentDoor.isWinner){
                labelWinner = "You win"
                break
            }
        }
        labelCenter.text = labelWinner
    }
    
    // Button actions
    
    @IBAction func leftDoorAction(_ sender: Any) {
        if(mode == 0){
            shuffleDoors[0].isSelected = true
            showDoorWithGoat()
            mode += 1
        }else if(mode == 1){
            if(shuffleDoors[0].isDoorOpen && !shuffleDoors[0].isWinner){
                labelCenter.text = "You can't select this one"
            }else{
                resetSelection()
                shuffleDoors[0].isSelected = true
                showAllPrizes()
            }
        }
    }
    
    @IBAction func centerDoorAction(_ sender: Any) {
        if(mode == 0){
            shuffleDoors[1].isSelected = true
            showDoorWithGoat()
            mode += 1
        }else if(mode == 1){
            if(shuffleDoors[1].isDoorOpen && !shuffleDoors[1].isWinner){
                labelCenter.text = "You can't select this one"
            }else{
                resetSelection()
                shuffleDoors[1].isSelected = true
                showAllPrizes()
            }
        }
    }
    
    @IBAction func rightDoorAction(_ sender: Any) {
        if(mode == 0){
            shuffleDoors[2].isSelected = true
            showDoorWithGoat()
            mode += 1
        }else if(mode == 1){
            if(shuffleDoors[2].isDoorOpen && !shuffleDoors[2].isWinner){
                labelCenter.text = "You can't select this one"
            }else{
                resetSelection()
                shuffleDoors[2].isSelected = true
                showAllPrizes()
            }
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        initDoors()
    }
}

