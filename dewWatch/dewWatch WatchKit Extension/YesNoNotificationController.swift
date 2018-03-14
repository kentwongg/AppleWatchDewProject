//
//  YesNoNotificationController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

import WatchKit
import Foundation
import UserNotifications

class YesNoNotificationController: WKUserNotificationInterfaceController {

    override init() {
        // Initialize variables here.
        super.init()
        
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


    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
//         This method is called when a notification needs to be presented.
//         Implement it if you use a dynamic notification interface.
//         Populate your dynamic notification interface as quickly as possible.
//
//         After populating your dynamic notification interface call the completion block.
        completionHandler(.custom)
    }

    
    
// this below section is designed to handle the recording of the yes/no notifications
// not implemented but code is current and from apple
// the issue: will not trigger/evaluate true for the first if logic check
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//        if response.notification.request.content.categoryIdentifier == "myCategory3" {
//            // Handle the actions for the yes/no question
//            if response.actionIdentifier == "YesButtonAction" {
//                // save and send
//
//                //MARK: storage logic
//                var responseValue = 34
//
//                // GROUP APP MUST BE ADDED/FIXED
//                // SEE dewwatch/ViewController.swift
//                var defaults = UserDefaults(suiteName: "group.com.exdee.watchteam") // 1. Create UserDefaults Environment /w Suite Name: Group name
//                // Use the Group Name for the Group App
//
//                defaults?.set(responseValue, forKey: "sharedStoredResponse") // 2. Set an object on that UserDefaults
//
//                defaults?.synchronize() // 3. sync, necessary so iPhone can access data
//
//                var receivedResponse: AnyObject? = UserDefaults.standard.object(forKey: "sharedStoredResponse") as AnyObject // this is the handler var to
//
//                if var responseValue = receivedResponse as? Int {
//                    print (receivedResponse)
//                }
//
//
//            }
//            else if response.actionIdentifier == "NoButtonAction" {
//                // save and send
//            }
//        }
//
//        // Else handle actions for other notification types. . .
//    }

    /*
    "title": "Yes",
    "identifier": "YesButtonAction"
},
{
    "title": "No",
    "identifier": "NoButtonAction"
 
 */
    
    //should work for a remote notification
//    override func handleAction(withIdentifier identifier: String?, forRemoteNotification remoteNotification: [AnyHashable : Any]) {
//        if let notif = identifier{
//            if notif == "YesButtonAction"{
//                print("YES IS PRESSED")
//            }
//            else{
//                 print("NO IS PRESSED")
//            }
//        }
//    }
    
//    override func handleAction(withIdentifier identifier: String?,
//                      for localNotification: UILocalNotification){
//                if let notif = identifier{
//                    if notif == "YesButtonAction"{
//                        print("YES IS PRESSED")
//                    }
//                    else{
//                         print("NO IS PRESSED")
//                    }
//                }
//    }
    
}
