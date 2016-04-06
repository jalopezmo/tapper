//
//  ViewController.swift
//  tapper
//
//  Created by Jaime Andres Lopez Mora on 5/04/16.
//  Copyright © 2016 Jaime Andres Lopez Mora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Properties
    var maxTaps:Int = 0
    var currentTaps:Int = 0
    var initialState:Bool = true
    
    //Outlets
    @IBOutlet weak var logoImageView:UIImageView!
    @IBOutlet weak var tapsTextField:UITextField!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var coinButton:UIButton!
    @IBOutlet weak var tapsLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logoImageView.hidden = false
        tapsTextField.hidden = false
        playButton.hidden = false
        coinButton.hidden = true
        tapsLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playPressed(sender:UIButton!) -> Void {
        if(tapsTextField.text != nil && tapsTextField.text != "") {
            toggleUI()
            
            maxTaps = Int(tapsTextField.text!)!
            
            updateTapsLabel()
        }
        else {
            let alert:UIAlertController = UIAlertController(title: "Watch out!", message: "You have to specify how many taps you need to win", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func coinPressed(sender:UIButton!) -> Void {
        currentTaps += 1
        updateTapsLabel()
        
        if(isGameOver()) {
            restartGame()
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func toggleUI() {
        logoImageView.hidden = !logoImageView.hidden
        tapsTextField.hidden = !tapsTextField.hidden
        playButton.hidden = !playButton.hidden
        coinButton.hidden = !coinButton.hidden
        tapsLabel.hidden = !tapsLabel.hidden
    }
    
    func isGameOver() -> Bool {
        if(currentTaps >= maxTaps) {
            return true
        }
        
        return false
    }
    
    func restartGame() {
        tapsTextField.text = ""
        maxTaps = 0
        currentTaps = 0
        
        toggleUI()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

