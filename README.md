Exdee Watch Read me
===========================

By Alex Brylov, Oscar Velez, and Kent Wong
CPSC 599 - iProgramming Fall 2017

Feature List that is implemented

1. Quiz
2. Notifications
3. Storage via userdefaults on watch and phone that synchronize
4. Muting of notifications 
5. List of questions, functions to randomize questions 

Feature list that is not fully implemented
1. Recording of user response to custom notifications - code is there but not properly implemented - commented out



How to test/install/use 

The most important part for the watch is that you must launch several of the apps (top left) to fully test all features.

1. Select the dewWatch App to see the place holder/mute feature (Console will print)
2. Select the dewWatch WatchKit App to see the actual Watch Application (the Quiz)
3. Select dewWatch WatchKit App Extension AND edit scheme 
    Edit Scheme - > Watch interface is "Dynamic Notification"
    Notification Payload is "YesNoNotification.apns" or "AchievementNotification" or "DriveNotification.apns"
4. To Test Storage (mute feature) , it can be done via hardware to see it in action or see the integer variable 34 
become persistent data (just as proof).

Must go into dewWatch WatchKit App/ Interface.storyboard and change first arrow to launch on click (the top right, not top left watch screen)

For actual hardware, pluggin in a phone with a watch attached bluetooth and then running the app on your real phone
muting and then pressing click to see that it is false # AppleWatchDewProject
# AppleWatchDewProject
