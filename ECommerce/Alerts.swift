//
//  Alerts.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class Alerts{
    class func showErrorAlert(view: UIViewController,title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        view.present(alert, animated: true, completion: nil)
    }
}
