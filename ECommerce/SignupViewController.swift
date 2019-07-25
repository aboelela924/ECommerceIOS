//
//  SignupViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/21/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SignupViewController: UIViewController, SignupViewDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var createAccountButton: UIButton!
    
    var presenter: SignupPresenter!
    var loadingInicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    fileprivate func createImageContainer(imageName: String) -> UIView{
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        let image = UIImage(named: imageName)
        imageView.image = image
        container.addSubview(imageView)
        imageView.center = container.center
        return container
    }
    
    func signupSuccess(user: User) {
        
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
    
}
