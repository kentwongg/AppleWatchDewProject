//
//  ComfirmationInterfaceController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

import WatchKit
import Foundation


class ComfirmationInterfaceController: WKInterfaceController {
    @IBOutlet var confirmationLabel: WKInterfaceLabel!
    
        
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let val: String = context as? String {
            self.confirmationLabel.setText(val)
        } else {
            self.confirmationLabel.setText("Error")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
