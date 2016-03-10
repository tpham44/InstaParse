//
//  LoginViewController.swift
//  codepathinsta
//
//  Created by JP on 3/1/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var SignIn: UIButton!
   
    @IBOutlet weak var SignUp: UIButton!

    @IBOutlet weak var UserNameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(UserNameField.text!, password: PasswordField.text!) { (user: PFUser?,error: NSError?) -> Void in
            
        if user != nil {
            //perform segue
            self.performSegueWithIdentifier("signInsegue", sender: self)
            
            print ("exist user successfully login")
            
        }else{
            print("user failed to login")
        }
    }
}
    
    @IBAction func onSignUp(sender: AnyObject) {
        // passing input string in text from user and user password
        let newUser = PFUser()
        
        newUser.username = UserNameField.text
        newUser.password = PasswordField.text
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegueWithIdentifier("signInsegue", sender: self)
                
                print ("New user successfully login")
            }
        }
    
    }

    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
