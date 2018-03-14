//
//  ViewController.swift
//  dewWatch
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong
import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var swithMute: UISwitch!
    
    let defaults = UserDefaults(suiteName: "group.com.exdee.watchteam")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK: storage logic
        let receivedResponse: AnyObject? = defaults?.object(forKey: "sharedStoredResponse") as AnyObject // this grabs the value
        if (receivedResponse as? Int) != nil {
            print (receivedResponse as Any)
        }
        
        defaults?.set(false, forKey: "Muted") // toggle for mute
        defaults?.synchronize() //synchronize updates values
    }

    var muted:Bool = false
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testClick(_ sender: Any) {
    
        // Notification Logic
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Time Down!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Your notification is arrived!", arguments: nil)
        content.sound = UNNotificationSound.init(named: "dew.aiff")
        
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
        var number = NSNumber()
        let nm = UIApplication.shared.applicationIconBadgeNumber+1
        number = NSNumber(value:nm)
        content.badge = number
        
        // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request)
    
        muteNotifications()

    }
    
    func muteNotifications()
    {
        let resp = defaults?.object(forKey: "Muted") as? Bool ?? Bool()
        print(resp)
        
        if (resp){
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
    }
    
    @IBAction func muteSwitch(_ sender: UISwitch) {
        if sender.isOn {
            defaults?.set(true, forKey: "Muted")
            defaults?.synchronize()
        } else {
            defaults?.set(false, forKey: "Muted")
            defaults?.synchronize()
        }
    }
}

