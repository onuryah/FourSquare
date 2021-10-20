//
//  ViewController.swift
//  FourSquare
//
//  Created by Ceren Çapar on 13.10.2021.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func signInButtonClicked(_ sender: Any) {
        if userNameTextField.text != "" && passwordTextField.text != ""{
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { user, error in
                if error != nil {
                    self.makeAlert(title: "ERROR!", message: error?.localizedDescription ?? "Error!")
                }else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else {
            makeAlert(title: "ERROR!", message: "Username/Password?")
        }
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if userNameTextField.text != "" && passwordTextField.text != "" {
            let user = PFUser()
            user.username = userNameTextField.text!
            user.password = passwordTextField.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(title: "ERROR!", message: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else {
            makeAlert(title: "ERROR!", message: "Username/Password?")
        }

        
    }
    
    func makeAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

