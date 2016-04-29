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
    
    var btnSound : AVAudioPlayer!
    
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
        btnSound.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

