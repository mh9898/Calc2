//
//  ViewController.swift
//  Calclator
//
//  Created by MiciH on 4/28/16.
//  Copyright © 2016 MicahelH. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operations : String {
        case Devide = "/"
        case Multi = "*"
        case Plus = "+"
        case Minus = "-"
        case Empty = ""
    }
    
    var btnSound : AVAudioPlayer!
    var runningNumber = ""
    var rightVarString = ""
    var leftVarString = ""
    var currentOpertion : Operations = Operations.Empty
    var result = ""
    
    @IBOutlet weak var outputLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //create a path to the sound file
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let audioURL = NSURL(fileURLWithPath: path!)
        do{
            try  btnSound = AVAudioPlayer(contentsOfURL: audioURL)
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
        
        btnSound.prepareToPlay()
    }
    
    @IBAction func numPress (butt: UIButton){
        playSound()
        
        //display the number
        runningNumber += "\(butt.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func devideAction(sender: AnyObject) {
        processOpertion(Operations.Devide)
    }
    
    
    @IBAction func mutiAction(sender: AnyObject) {
        processOpertion(Operations.Multi)
    }
    
    
    @IBAction func minusAction(sender: AnyObject) {
        processOpertion(Operations.Minus)
    }
    
    
    @IBAction func plusAction(sender: AnyObject) {
        processOpertion(.Plus)
    }
    
    
    @IBAction func equalAction(sender: AnyObject) {
        processOpertion(currentOpertion)
        
}
    
    func processOpertion(op: Operations){
        playSound()
        
        if currentOpertion != Operations.Empty {
            rightVarString = runningNumber
            outputLbl.text = ""
            
            if currentOpertion == Operations.Plus{
                result = "\(Double(runningNumber)! + Double(rightVarString)!)"
                            }
            else if currentOpertion == Operations.Minus{
                result = "\(Double(runningNumber)! - Double(rightVarString)!)"
            }
            else if currentOpertion == Operations.Multi{
                result = "\(Double(runningNumber)! - Double(rightVarString)!)"
            }
            else if currentOpertion == Operations.Devide{
                result = "\(Double(runningNumber)! - Double(rightVarString)!)"
            }
            
            leftVarString = result
            outputLbl.text = result

        }
        else{
            rightVarString = runningNumber
            outputLbl.text = ""
            runningNumber = ""
            currentOpertion = op
        }
        
        
    }
    
    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        else{
            btnSound.play()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

