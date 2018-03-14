//
//  ConfirmationLabelClass.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

import WatchKit

class ConfirmationLabelClass: WKInterfaceLabel {

    var labelText: String
    
    init?(setText: String) {
        labelText = setText
    }
    
}
