
//  ViewControllerA.swift
//  NotifyMe

import UIKit

/* MARK: STEP 4
 - Our job in the ViewControllerB is done. Now we need to execute three remaining steps
   in this controller i.e. ViewControllerA
 - Adopt the notifyMeDelegate protocol here.
 - Once you adopt the protocol, you will get a message that:
 "Type 'ViewControllerA' does not conform to protocol 'notifyMeDelegate'"
 - Once you conform to the protocol, you will find the method right below your class.
   You can use this method anywhere across your class body.
 */
class ViewControllerA: UIViewController, notifyMeDelegate {
    
    @IBOutlet weak var notificationLabel: UILabel!
    
    //We are not using viewDidLoad() for now
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     - I have shifted the method of the protocol to this place. You can use it anywhere.
     -  Here I am giving message that has been passed from ViewControllerB
     as an input to the the notificationLabel
     */
    func myMessage(message: String) {
        notificationLabel.text = message
    }
    
    /* MARK: STEP 5
     CREATE A REFERENCE TO ViewControllerB
     - Here we create a reference to ViewControllerB.
     - We use the name of the storyboard i.e "Main" in my case,
     and instantiate the ViewController which has an identiafier "ViewControllerB"
     with its associated class i.e ViewControllerB
     */
    @IBAction func goToViewControllerBAction(_ sender: UIButton) {
        let viewControllerB = UIStoryboard.init(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "ViewControllerB")
        as! ViewControllerB
        
        /* MARK: STEP 6
         ASSIGN THE DELEGATES OF ViewControllerB to yourself.
         - viewControllerB.delegate = self means that your are delegating the "delegate"
         in ViewControllerB to yourself.
         - Keep in mind that this is one step that most of us or atleast I forget most times.
         - Without, delegating the delegates to self, the data will not pass from ViewControllerB
         to ViewControllerA
         */
        viewControllerB.delegate = self
    
        // Present the ViewControllerB on tap of the button on ViewControllerA.
        present(viewControllerB, animated: true, completion: nil)
        
    }
    
}
