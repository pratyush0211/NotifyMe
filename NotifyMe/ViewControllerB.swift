
//  ViewControllerB.swift
//  NotifyMe

import UIKit

/* MARK: STEP 1
 - We declare the Protocol in the View Controller B.
 - Appending "Delegate" to your protocol name is a good practice
   since it will be easier to read.
 - The protocol can have any numbers of functions.
 - These functions will be executed when a certain action happens in the
   View Controller B which should trigger the ViewControllerA
 - The functions will have the paramater that will be delegated to ViewControllerA
   when the action is triggered in ViewControllerA. for e.g: Message, Boolean Value etc.
 */
protocol notifyMeDelegate {
    func myMessage(message: String)
}
class ViewControllerB: UIViewController {
    /* MARK: STEP 2
     
     - In the step 2, we create a delegate property here
     - This delegate must adopt to the protocol type i.e notifyMeDelegate
     - The delegate property has to be optional
     - We can decalre the property as weak to avoid memory leaks and retain cycle.
      But right now let's go ahead without weak.
     
     */
    var delegate : notifyMeDelegate?
    
    //We are not using viewDidLoad() for the time being
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /* MARK: STEP 3
     - In step 3, you call the delegate method, when the notifyViewControllerAction button is tapped.
     - Right now, the optional comes into play from step 2. Though we have not touched the ViewControllerA
     now and have not delegated anything, the app does not crash.
     - On the tap of the button, you call the function myMessage and send the message that you want to send
     to the ViewControllerA
     - After delegating the messsage, we dismiss the current view controller i.e. ViewControllerB
     - Right now the message won't be delegated because we have not touched the View Controller A
     
     */
    @IBAction func notifyViewControllerAAction(_ sender: UIButton) {
        delegate?.myMessage(message: "Hey, your crush has come to college today! Wake up and hit the classroom!")
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

