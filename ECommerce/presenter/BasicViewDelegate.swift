//
//  BasicPresenterDelegate.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
protocol BasicViewDelegate {
    func showError(message: String)
    func showLoading()
    func hideLoading()
}

