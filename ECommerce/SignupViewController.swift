//
//  SignupViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/21/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import FacebookCore
import FacebookLogin
import FBSDKLoginKit


class SignupViewController: UIViewController, SignupViewDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var createAccountButton: UIButton!
    @IBOutlet var facebookLogin: UIStackView!
    
    var presenter: SignupPresenter!
    var loadingInicator: NVActivityIndicatorView!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        presenter = SignupPresenter(view: self)
        
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.clipsToBounds = true
        
        nameTextField.leftViewMode = .always
        nameTextField.leftView = createImageContainer(imageName: "user")
        
        phoneTextField.leftViewMode = .always
        phoneTextField.leftView = createImageContainer(imageName: "smartphone")
        
        emailTextField.leftViewMode = .always
        emailTextField.leftView = createImageContainer(imageName: "envelope")
        
        passwordTextField.leftViewMode = .always
        passwordTextField.rightViewMode = .always
        passwordTextField.leftView = createImageContainer(imageName: "locked")
        passwordTextField.rightView = createImageContainer(imageName: "eye")
        let showHideGesture = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.showHidePass(_:)))
        showHideGesture.numberOfTapsRequired = 1
        passwordTextField.rightView?.addGestureRecognizer(showHideGesture)
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let facebookLoginTap = UITapGestureRecognizer(target: self, action: #selector(loginButtonClicked))
        facebookLogin.addGestureRecognizer(facebookLoginTap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.string(forKey: "apiToken") != nil){
            print(UserDefaults.standard.string(forKey: "apiToken"))
            performSegue(withIdentifier: "goToHomeFromSignup", sender: self)
        }
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [ .publicProfile, .email, ], viewController: self) { loginResult in
            switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    let myGraphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, birthday, age_range, picture.width(400), gender"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: .get)
                    myGraphRequest.start(completionHandler: { (connection, result, error) in
                        if let res = result {
                            var responseDict = res as! [String:Any]
                            
                            let fullName = responseDict["name"] as! String
                            let firstName = responseDict["first_name"] as! String
                            let lastName = responseDict["last_name"] as! String
                            let email = responseDict["email"] as! String
                            let idFb = responseDict["id"] as! String
                            let pictureDict = responseDict["picture"] as! [String:Any]
                            let imageDict = pictureDict["data"] as! [String:Any]
                            let imageUrl = imageDict["url"] as! String
                            
                            print("user id: \(idFb), firstName: \(firstName), fullname: \(fullName), lastname: \(lastName), picture: \(imageUrl), email: \(email)")
                        }
                    })
                    /*myGraphRequest.start(completionHandler: { (connection, result, error) in
                        if let res = result {
                            var responseDict = res as! [String:Any]
                 
                            let fullName = responseDict["name"] as! String
                            let firstName = responseDict["first_name"] as! String
                            let lastName = responseDict["last_name"] as! String
                            let email = responseDict["email"] as! String
                            let idFb = responseDict["id"] as! String
                            let pictureDict = responseDict["picture"] as! [String:Any]
                            let imageDict = pictureDict["data"] as! [String:Any]
                            let imageUrl = imageDict["url"] as! String
                 
                            print("user id: \(idFb), firstName: \(firstName), fullname: \(fullName), lastname: \(lastName), picture: \(imageUrl), email: \(email)")
                        }
                })*/
            }
        }
    }
    
    @objc func showHidePass(_ sender: UITapGestureRecognizer){
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        view.layoutIfNeeded()
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        let userName: String = nameTextField.text!
        let email: String = emailTextField.text!
        let phoneNumber: String = phoneTextField.text!
        let password: String = passwordTextField.text!
        
        if(FieldsChecker.isValidName(name: userName)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "Invalid Name")
            return
        }
        
        if(!FieldsChecker.isValidEmail(email: email)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "Invalid Email")
            return
        }
        
        if(!FieldsChecker.isValidePhoneNumber(value: phoneNumber)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "Invalid Phone number")
            return
        }
        
        presenter.signup(name: userName, email: email, phoneNumber: phoneNumber, password: password)
    }
    
    func createImageContainer(imageName: String) -> UIView{
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        let image = UIImage(named: imageName)
        imageView.image = image
        container.addSubview(imageView)
        imageView.center = container.center
        return container
    }
    
    func signupSuccess(user: User) {
        self.user = user
        UserDefaults.standard.set(user.apiToken ,forKey: "apiToken")
        performSegue(withIdentifier: "goToHomeFromSignup", sender: self)
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        createAccountButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
        createAccountButton.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToHomeFromSignup"){
            let destination = segue.destination as! HomeViewController
            destination.user = self.user
        }
    }
    
}
