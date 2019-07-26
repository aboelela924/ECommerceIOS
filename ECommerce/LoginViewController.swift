//
//  LoginViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/25/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire

class LoginViewController: UIViewController, SigninViewDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signinButton: UIButton!
    
    
    var loadingInicator: NVActivityIndicatorView!
    var presenter: SigninPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SigninPresenter(view: self)

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
    
    @IBAction func signin(_ sender: UIButton) {
        let phoneOrEmail: String = emailTextField.text!
        let password: String = passwordTextField.text!
        
        if(!FieldsChecker.isValidEmail(email: phoneOrEmail) && !FieldsChecker.isValidePhoneNumber(value: phoneOrEmail)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "Not a valid email or phone number")
            return
        }
        
        presenter.signin(phoneOrEmail, password)
        
    }
    
    func onSigninSuccess(user: User) {
        print(user)
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        signinButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
        signinButton.isEnabled = true
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
    
    fileprivate func createImageContainer(imageName: String) -> UIView{
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        let image = UIImage(named: imageName)
        imageView.image = image
        container.addSubview(imageView)
        imageView.center = container.center
        return container
    }
    
    
}
