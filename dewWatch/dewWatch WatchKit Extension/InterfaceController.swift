//
//  InterfaceController.swift
//  dewWatch WatchKit Extension
//
// CPSC 599 iProgramming  - exdee watch group
// Alex Brylov
// Oscar Velez
// Kent Wong

import WatchKit
import Foundation


// quiz logic
internal struct QuizTemplate {
    
    var Question =  String()
    
    var CorrectAnswer = Int()
    
    var Answers = [String]()
}

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var QuestionLabel: WKInterfaceLabel!
    @IBOutlet var Button1: WKInterfaceButton!
    @IBOutlet var Button2: WKInterfaceButton!
    @IBOutlet var Button3: WKInterfaceButton!
    @IBOutlet var Button4: WKInterfaceButton!
    
    //quiz variables
    var QuizObject = [QuizTemplate]()
    var NumberPicked = Int()
    var RealAnswer = Int()
    
    @IBAction func ActionButton1() {
        NumberPicked = 0
        RightWrong()
    }
    
    @IBAction func ActionButton2() {
        NumberPicked = 1
        RightWrong()
    }
    @IBAction func ActionButton3() {
        NumberPicked = 2
        RightWrong()
    }
    @IBAction func ActionButton4() {
        NumberPicked = 3
        RightWrong()
    }
    
    
    
    
    
    @IBOutlet var table: WKInterfaceTable!
    var data = ["Progress", "Insight", "Questions"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // upon wake up
        
        //MARK: storage logic
        let responseValue = 34
        
        // GROUP APP MUST BE ADDED/FIXED
        // SEE dewwatch/ViewController.swift
        let defaults = UserDefaults(suiteName: "group.com.exdee.watchteam") // 1. Create UserDefaults Environment /w Suite Name: Group name
        // Use the Group Name for the Group App
        
        defaults?.set(responseValue, forKey: "sharedStoredResponse") // 2. Set an object on that UserDefaults
        
        defaults?.synchronize() // 3. sync, necessary so iPhone can access data
        
        let receivedResponse: AnyObject? = UserDefaults.standard.object(forKey: "sharedStoredResponse") as AnyObject // this is the handler var to
        
        if (receivedResponse as? Int) != nil {
            print (receivedResponse as Any)
        }
        
        // Configure interface objects here.
        QuizObject = [QuizTemplate(Question: "Which age group gets the most anxiety? ", CorrectAnswer: 1, Answers:["Elderly","Adolescents","Children","Young Adults"] ),
                      QuizTemplate(Question: "Which of these is the most frequently diagnosed in the US?", CorrectAnswer: 0, Answers: ["Anxiety","Panic","Social Phobia","OCD"]),
                      QuizTemplate(Question: "Going on a run releases which chemical in your brain?", CorrectAnswer: 3, Answers: ["Oxytocin","Seratonin","Norepinephrine","Endorphin"]),
                      QuizTemplate(Question: "Who can develop an eating disorder?", CorrectAnswer: 0, Answers: ["All ages and genders","Men","Women","Teenagers"]),
                      QuizTemplate(Question: "Which age group suffers mostly from depression?", CorrectAnswer: 3, Answers: ["Young men","Elderly Adults","Teenagers","Young Women"]),
                      QuizTemplate(Question: "What is bipolar disorder also commonly called?", CorrectAnswer: 1, Answers: ["Schizophrenia","Manic depression","Dysthymia","Chronic Depression"]),
                      QuizTemplate(Question: "How many people will experience some kind of mental health problem?", CorrectAnswer: 0, Answers: ["1 in 4","1 in 10","1 in 6","1 in 3"]),
                      QuizTemplate(Question: "What percentage of children have a mental health problem?", CorrectAnswer: 1, Answers: ["15%","10%","5%","20%"]),
                      QuizTemplate(Question: "What are unhealthy habits?", CorrectAnswer: 2, Answers: ["Exercising","Meditating","Drinking alcohol","Eating healthy"])
        ]
        RandomQuestion()
    }
    
    
    //function chooses random question from list of QuizObject
    func RandomQuestion() {
        let RandomNumber = Int(arc4random_uniform(UInt32(QuizObject.count)))
        Button1.setTitle(QuizObject[RandomNumber].Answers[0])
        Button2.setTitle(QuizObject[RandomNumber].Answers[1])
        Button3.setTitle(QuizObject[RandomNumber].Answers[2])
        Button4.setTitle(QuizObject[RandomNumber].Answers[3])
        
        QuestionLabel.setText(QuizObject[RandomNumber].Question)
        RealAnswer = QuizObject[RandomNumber].CorrectAnswer
        
        
    }
    
    func RightWrong() {
        if (NumberPicked == RealAnswer) {
            WKInterfaceDevice().play(.success)
            RandomQuestion()
            QuestionLabel.setTextColor(UIColor.white)
            
        }
        else {
            //if user chooses wrong question, sets title to red
            //should play haptic vibration in theory
            QuestionLabel.setTextColor(UIColor.red)
            WKInterfaceDevice().play(.failure)
        }
        
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
       // tableRefresh()         // commented out as it is tied with tablerefresh, implemented Oscar's changes
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    /*
     // This is commented out after implementing Oscar's Main Menu implementation 
    func tableRefresh(){
       table.setNumberOfRows(data.count, withRowType: "row")
        
        for index in 0 ..< table.numberOfRows {
            let row = table.rowController(at: index) as! TableRowController
            let buttonText = data[index]
            
            row.button.setTitle(buttonText)
            let img = UIImage(named: "blueLine")
            row.image.setImage(img)
        }
    } */

}
