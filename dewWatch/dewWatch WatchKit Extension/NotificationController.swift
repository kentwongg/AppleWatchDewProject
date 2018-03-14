//
//  NotificationController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

// This has the majority of the notification logic

import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {
    @IBOutlet var label: WKInterfaceLabel!

    var messages = [
        "You look good today!",
        "Have an amazing day!",
        "I hope your day is as amazing as you are!",
        "The day is what you make it! So why not make it a great one?" ,
        "Write it on your heart that every day is the best day in the year.",
        "Being miserable is a habit; being happy is a habit; and the choice is yours.",
        "You cannot tailor-make the situations in life but you can tailor-make the attitudes to fit those situations.",
        "Things turn out best for the people who make the best of the way things turn out.",
        "The greatest success stories were created by people who recognized a problem and turned it into an opportunity.",
        "The greatest discovery of all time is that a person can change his future by merely changing his attitude.",
        "Optimism is the most important human trait.",
        "Welcome every morning with a smile. Look on the new day as another special gift"
        
// Function below populates a random message
        
    ]
    
    func randomMessage() -> String{
        let randomNum = Int(arc4random_uniform(UInt32(messages.count)))
        return messages[randomNum]
    }
    
    func updateNotificationUserInfo(userInfo: [String: Any]){
        if let aps = userInfo["aps"] as? NSDictionary
        {
            if let alert = aps["alert"] as? NSDictionary{
             if let body = alert["body"] as? String {
            label.setText(body)
            }
            }
        }
    }
    
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
    
    // it works, just don't know yet how to send a remote notification
//    override func didReceiveRemoteNotification(_ remoteNotification: [AnyHashable : Any], withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Void) {
//
//        print(remoteNotification)
//        print("-----------------------------------------")
//        let aps = remoteNotification[AnyHashable("aps")]! as! NSDictionary
//
//        let alert = aps["alert"]! as! NSDictionary
//
//        let body = alert["body"] as! String
//        let title = alert["title"] as! String
//
//        print(body)
//        print(title)
//
//        let test = aps["Test"]!  as! String
//        print(test)
//
//        let message = remoteNotification[AnyHashable("Message")]! as! String
//        print(message)
//
//    }

    
    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        
//         This method is called when a notification needs to be presented.
//         Implement it if you use a dynamic notification interface.
//         Populate your dynamic notification interface as quickly as possible.
//
//         After populating your dynamic notification interface call the completion block.
//
        
        label.setText(randomMessage())

        completionHandler(.custom)

    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Update the app interface directly.

        // Play a sound.
        completionHandler(UNNotificationPresentationOptions.sound)
    }
//
//    override func handleAction(withIdentifier identifier: String?, for localNotification: UILocalNotification) {
//        if let notIdentifier = identifier{
//
//            if notIdentifier == "YesButtonAction" {
//            print("Yes Clicked")
//            }
//            else{
//                print("no Clicked")
//            }
//        }
//    }

    // handler function to receive notifications
    func receivedNotification()
    {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Time Down!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Your notification is arrived!", arguments: nil)
        content.sound = UNNotificationSound.default()
        
        
        // Deliver the notification in..
        
        //..Date
        //let myDate = NSDate()
        //let calendar = NSCalendar.current
        //let dateComponents = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: myDate)
        //var trigger = UNCalendarNotificationTrigger.triggerWithDateMatchingComponents(dateComponents, repeats: false)
        //..Timeinterval
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest.init(identifier: "FiveSecond", content: content, trigger: trigger)
        
        //set icon badge
        
        
        // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    //    Dear maintainer:
    //
    // Once you are done trying to 'optimize' this routine,
    // and have realized what a terrible mistake that was,
    // please increment the following counter as a warning
    // to the next guy:
    //
    // total_hours_wasted_here = 42
}
