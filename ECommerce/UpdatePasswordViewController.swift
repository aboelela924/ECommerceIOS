//
//  UpdatePasswordViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UpdatePasswordViewController: UIViewController, ResetPasswordViewDelegate {
   
    var phoneNumber: String!
    var resetCode: Int!
    var loadingInicator: NVActivityIndicatorView!
    var presenter: ResetPasswordPresenter!
    
    @IBOutlet var newPasswrodTextField: UITextField!
    @IBOutlet var reEnterNewPassword: UITextField!
    @IBOutlet var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ResetPasswordPresenter(view: self)
        
        updateButton.backgroundColor = .clear
        updateButton.layer.cornerRadius = 5
        updateButton.layer.borderWidth = 1
        updateButton.layer.borderColor = UIColor.black.cgColor
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(UpdatePasswordViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
    }
    
    @IBAction func updatePassword(_ sender: UIButton) {
        let password = newPasswrodTextField.text!
        let confirmPassword = reEnterNewPassword.text!
        
        if(!FieldsChecker.arePasswordMatches(pass: password, confirmPass: confirmPassword)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "passwords doesn't match")
            return
        }
        presenter.updatePassword(phoneNumber: phoneNumber, resetCode: resetCode, password: password)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func onSuccess(message: String, user: User) {
        Alerts.showErrorAlert(view: self, title: "Success", message: message)
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        updateButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
        updateButton.isEnabled = true
    }
    


}
