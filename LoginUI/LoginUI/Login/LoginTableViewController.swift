//
//  LoginTableViewController.swift
//  LoginUI
//
//  Created by Yogesh Patel on 22/01/21.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var btnFacebook: FBLoginButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookLogin()
        googleLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.dismissKeyboard()
    }
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        ValidationCode()
    }
    
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    
    @IBAction func btnGoogleTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func facebookLogin(){
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"], tokenString: token, version: nil, httpMethod: .get)
            request.start { (connection, result, error) in
                print("\(result)")
            }
        }else{
            btnFacebook.permissions = ["public_profile", "email"]
            btnFacebook.delegate = self
        }
    }
    
    func googleLogin(){
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        if GIDSignIn.sharedInstance().hasPreviousSignIn(){
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
            print("Already Login")
        }
    }
}

extension LoginTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}

extension LoginTableViewController{
    fileprivate func ValidationCode() {
        if let email = txtEmail.text, let password = txtPassword.text{
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else{
                // Navigation - Home Screen
            }
        }else{
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
}

extension LoginTableViewController: LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"], tokenString: token, version: nil, httpMethod: .get)
        request.start { (connection, result, error) in
            print("\(result)")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout")
    }
    
    
}

extension LoginTableViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("\(user.profile.email ?? "No Email")")
    }
}
