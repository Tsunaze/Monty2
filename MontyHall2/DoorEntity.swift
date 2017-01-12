//
//  DoorEntity.swift
//  MontyHall2
//
//  Created by Pierre-Marie Galite on 12/01/17.
//  Copyright © 2017 Pierre-Marie Galite. All rights reserved.
//

import Foundation
import UIKit

class DoorEntity{
    
    var currentImage:UIImage = #imageLiteral(resourceName: "door")
    
    var button:UIButton?
    
    var hiddenImage:UIImage?
    
    var prize:String?
    
    var isSelected:Bool = false
    
    var isDoorOpen:Bool = false
    
    var isWinner:Bool{
        return prize == "car"
    }
    
    init(initialPrize:String) {
        prize = initialPrize
        if let p = prize{
            if(p == "car"){
                hiddenImage = #imageLiteral(resourceName: "car")
            }else{
                hiddenImage = #imageLiteral(resourceName: "goat")
            }
        }
    }

    func initDoorImage(with b:UIButton){
        button = b
        if let doorButton = button{
            doorButton.setBackgroundImage(currentImage, for: .normal)
        }
    }
    
    func showPrize() {
        isDoorOpen = true
        if let image = hiddenImage{
            currentImage = image
            if let doorButton = button{
                doorButton.setBackgroundImage(currentImage, for: .normal)
            }
        }
    }
    
}
