//
//  CheckinInterfaceController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

import WatchKit
import Foundation


class CheckinInterfaceController: WKInterfaceController {

    var message = "Amazing"
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
// logic for the mood you are in
    @IBAction func clickAmazing() {
        message = "Amazing"
    }
    
    @IBAction func clickGood() {
        message = "Good"
    }
    @IBAction func clickNeutral() {
        message = "Neutral"
    }
    @IBAction func clickBad() {
        message = "Bad"
    }
    @IBAction func clickDown() {
        message = "Down"
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        print(segueIdentifier)
    
        return segueIdentifier
    }
}
