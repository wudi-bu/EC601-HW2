//
//  ViewController.swift
//  ec601_homework2
//
//  Created by 吴迪 on 2016/9/27.
//  Copyright © 2016年 吴迪. All rights reserved.
//

import UIKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate{
    
    @IBOutlet weak var Yearofbirth: UITextField!
    @IBOutlet weak var Image: UIImageView!
    
    //Constant needed to calculate zodiac year
    let offset = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        let theHeight = view.frame.size.height //grabs the height of your view
        if(FBSDKAccessToken.current() == nil){
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            loginView.frame = CGRect(x: 0, y: theHeight - 50 , width: self.view.frame.width, height: 50)// set login button at the bottom
            loginView.readPermissions = ["public_profile", "email", "user_friends"]  // set permision of login
            loginView.delegate = self
            self.view.addSubview(loginView)
            
        print("not logged in")
        
        }
        else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.loginButtonDidLogOut(loginView)
            self.view.addSubview(loginView)
            loginView.frame = CGRect(x: 0, y: theHeight - 50 , width: self.view.frame.width, height: 50)
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
            print("logged in")
            fetchprofile()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    // addition test to fetch user info after login to facebook
    func fetchprofile(){
        print("fetch profile")
        let parameters = ["fields":"email,first_name,last_name,picture.type(large)"] //set request permission
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, result, error) -> Void in
            if error != nil {
            print(error)
                return
            }
            if let email = result as? [String:[AnyObject]]{
                print(email) //print current login user's email in the console
            }
        })
    
    }


    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("logged in")
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
    }
    // let textfield to lose focus after touch to give better usability
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         Yearofbirth.resignFirstResponder()
    }
    @IBAction func Okclicked(_ sender: AnyObject) {
        Yearofbirth.resignFirstResponder()   //let textfield to lose focus onclick
        if let year = Int(Yearofbirth.text!){
            let imageNumber = (year-offset)%12
            Image.image = UIImage(named: String(imageNumber))
        }
    }


}

