//
//  ForgetPasswordViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ForgetPasswordViewController: UIViewController, SendResetPasswordViewDelegate {
    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var resetButton: UIButton!
    
    
    var loadingInicator: NVActivityIndicatorView!
    var presenter: SendResetPasswordPresenter!
    var code: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SendResetPasswordPresenter(view: self)
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ForgetPasswordViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
        
        
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
       
    @IBAction func sendResetSMS(_ sender: UIButton) {
        let phoneNumber: String = phoneNumberTextField.text!
        if(!FieldsChecker.isValidePhoneNumber(value: phoneNumber)){
            Alerts.showErrorAlert(view: self, title: "Error", message: "Invalid Phone Number")
            return
        }
        presenter.sendResetRequest(phoneNumber: phoneNumber)
    }
    
    
    func onResetResponse(message: String, code: Int) {
        self.code = code
        performSegue(withIdentifier: "toAddRestCode", sender: self)
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        resetButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
        resetButton.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toAddRestCode"){
            let destination = segue.destination as! AddResetCodeViewController
            destination.resetCode = code
            destination.phoneNumber = phoneNumberTextField.text!
        }
    }
    
}
