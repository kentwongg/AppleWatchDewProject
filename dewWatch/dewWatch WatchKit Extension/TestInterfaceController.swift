//
//  TestInterfaceController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong



import WatchKit
import Foundation
import UserNotifications

class TestInterfaceController: WKInterfaceController {

    var muted:Bool = false
    
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

    @IBAction func clickTest() {
        sendMyNotification()
    }
    
    
    // this function tests and sends a notification to the phone as proof of concept
    
    func sendMyNotification(){
            
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
        
        muteNotifications()
    }
    
    func muteNotifications()
    {
        let defaults = UserDefaults(suiteName: "group.com.exdee.watchteam")

        let resp = defaults?.object(forKey: "Muted") as? Bool ?? Bool()
        defaults?.synchronize()
        
        print(resp)
        
        if (resp){
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }

}
