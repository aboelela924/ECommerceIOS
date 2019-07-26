//
//  AddResetCodeViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import NVActivityIndicatorView

class AddResetCodeViewController: UIViewController, UITextFieldDelegate, SendResetPasswordViewDelegate {

    var resetCode: Int!
    var phoneNumber: String!
    var textFields = [SkyFloatingLabelTextField]()
    var presenter: SendResetPasswordPresenter!
    var loadingInicator: NVActivityIndicatorView!
    
    @IBOutlet var resetCodeTextFieldOne: SkyFloatingLabelTextField!
    @IBOutlet var resetCodeTextFieldTwo: SkyFloatingLabelTextField!
    @IBOutlet var resetCodeTextFieldThree: SkyFloatingLabelTextField!
    @IBOutlet var resetCodeTextFieldFour: SkyFloatingLabelTextField!
    @IBOutlet var resendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SendResetPasswordPresenter(view: self)
        
        resendButton.backgroundColor = .clear
        resendButton.layer.cornerRadius = 5
        resendButton.layer.borderWidth = 1
        resendButton.layer.borderColor = UIColor.black.cgColor
        
        resetCodeTextFieldOne.delegate = self
        resetCodeTextFieldTwo.delegate = self
        resetCodeTextFieldThree.delegate = self
        resetCodeTextFieldFour.delegate = self
        
        textFields.append(resetCodeTextFieldOne)
        textFields.append(resetCodeTextFieldTwo)
        textFields.append(resetCodeTextFieldThree)
        textFields.append(resetCodeTextFieldFour)
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(AddResetCodeViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
    }
    

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }
    
    @IBAction func resendResetCode(_ sender: UIButton) {
        presenter.sendResetRequest(phoneNumber: phoneNumber!)
    }
    
    @IBAction func textFieldChange(_ textField: UITextField) {
        let index = textFields.firstIndex(of: textField as! SkyFloatingLabelTextField)!
        let text: String = textField.text!
        if(text.isEmpty){
            if(index != 0){
                let field = textFields[index-1]
                field.becomeFirstResponder()
            }
        }else{
            if(index != 3){
                let field = textFields[index+1]
                field.becomeFirstResponder()
            }else if(index == 3){
                let enteredResetCode = Int("\(resetCodeTextFieldOne.text!)\(resetCodeTextFieldTwo.text!)\(resetCodeTextFieldThree.text!)\(resetCodeTextFieldFour.text!)")
                if(resetCode! == enteredResetCode){
                    performSegue(withIdentifier: "goToUpdatePassword", sender: self)
                }else{
                    Alerts.showErrorAlert(view: self, title: "Error", message: "Invalid reset code")
                }
            }
        }
    }
    
    func onResetResponse(message: String, code: Int) {
        self.resetCode = code
        Alerts.showErrorAlert(view: self, title: "Success", message: "Code is sent successfully.")
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        resendButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
        resendButton.isEnabled = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToUpdatePassword"){
            let destination = segue.destination as! UpdatePasswordViewController
            destination.phoneNumber = self.phoneNumber
            destination.resetCode = self.resetCode
        }
    }
    
}
