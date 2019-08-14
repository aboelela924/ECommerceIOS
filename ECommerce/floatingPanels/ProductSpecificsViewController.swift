//
//  ProductSpecificsViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/10/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import FloatingPanel
import ChameleonFramework
import NVActivityIndicatorView

class ProductSpecificsViewController: UIViewController {
    
    var productId: Int!
    var sizes: [Size]!
    var colors: [Color]!
    var sizeLabels = [PaddingLabel]()
    var colorLabels = [PaddingLabel]()
    var selectedSizeLabel: PaddingLabel!
    var selectedColorLabel: PaddingLabel!
    var loadingInicator: NVActivityIndicatorView!
    var presenter: CartPresenter!
    
    @IBOutlet var sizeView: UIView!
    @IBOutlet var colorView: UIView!
    @IBOutlet var sizeStackView: UIStackView!
    @IBOutlet var colorStackView: UIStackView!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var addToCartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CartPresenter(view: self)
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        if(sizes.count == 0){
            sizeView.removeFromSuperview()
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48.0)
        }else{
            var index = 0;
            for size in sizes{
                let label = PaddingLabel()
                label.text = size.size
                label.textAlignment = .center
                label.layer.borderWidth = 2.0
                label.layer.borderColor = UIColor.flatGray.cgColor
                label.textColor = UIColor.flatGray
                label.topInset = 10.0
                label.bottomInset = 10.0
                label.leftInset = 10.0
                label.rightInset = 10.0
                label.sizeToFit()
                label.isUserInteractionEnabled = true
                label.layer.cornerRadius = 0.7 * label.bounds.size.width
                label.tag = index
                sizeLabels.append(label)
                index+=1
                let labelTap = UITapGestureRecognizer(target: self, action: #selector(ProductSpecificsViewController.labelClick(_:)))
                labelTap.numberOfTapsRequired = 1
                label.addGestureRecognizer(labelTap)
                sizeStackView.addArrangedSubview(label)
            }
        }
        
        
        
        
        if(colors.count == 0){
            colorView.removeFromSuperview()
            quantityLabel.translatesAutoresizingMaskIntoConstraints = false
            
            if(sizeView.isDescendant(of: self.view)){
                quantityLabel.topAnchor.constraint(equalTo: sizeView.bottomAnchor, constant: 48.0).isActive = true
            }else{
                quantityLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48.0).isActive = true
            }
            
        }else{
            
            var index = 0
            for color in colors{
                
                let label = PaddingLabel()
                label.isUserInteractionEnabled = true
                label.topInset = 10.0
                label.bottomInset = 10.0
                label.leftInset = 10.0
                label.rightInset = 10.0
                label.backgroundColor = UIColor(hexString: color.color)
                label.layer.masksToBounds = true
                label.text = "O"
                label.textColor = UIColor.clear
                label.sizeToFit()
                label.layer.cornerRadius =   label.bounds.size.width
                label.tag = index
                index += 1
                let labelTap = UITapGestureRecognizer(target: self, action: #selector(ProductSpecificsViewController.colorLabeClick(_:)))
                label.addGestureRecognizer(labelTap)
                colorLabels.append(label)
                colorStackView.addArrangedSubview(label)
               
            }
            
        }
        
    }
    

    @IBAction func incrementQuantity(_ sender: Any) {
        let current: Int = Int(quantityLabel.text!)!
        quantityLabel.text = String(current + 1)
    }
    
    @IBAction func decrementQuantity(_ sender: Any) {
        let current: Int = Int(quantityLabel.text!)!
        if(current > 1){
           quantityLabel.text = String(current - 1)
        }
    }
    
    @objc func labelClick(_ sender: AnyObject){
        if let select = selectedSizeLabel {
            /*select.textColor = UIColor.flatGray
            select.backgroundColor = UIColor.white
            select.layer.borderWidth = 2.0
            select.layer.borderColor = UIColor.clear.cgColor*/
            select.backgroundColor = UIColor.clear
            select.layer.masksToBounds = false
            select.layer.borderColor = UIColor.flatGray.cgColor
            select.textColor = UIColor.flatGray
        }
        selectedSizeLabel = sizeLabels[sender.view!.tag]
        selectedSizeLabel.backgroundColor = UIColor.flatBlack
        selectedSizeLabel.layer.masksToBounds = true
        selectedSizeLabel.layer.borderColor = UIColor.flatGray.cgColor
        selectedSizeLabel.textColor = UIColor.flatWhite
    }
    
    @objc func colorLabeClick(_ sender: AnyObject){
        if let select = selectedColorLabel {
            select.layer.borderColor = UIColor.clear.cgColor
        }
        
        selectedColorLabel = colorLabels[sender.view!.tag]
        selectedColorLabel.layer.masksToBounds = true
        selectedColorLabel.layer.borderWidth = 5.0
        selectedColorLabel.layer.borderColor = UIColor.flatRed.cgColor
    }

    @IBAction func addToCart(_ sender: Any) {
        var params: [String: Any] = ["api_token": GlobalUser.getInstance().user.apiToken!, "product_id": productId!, "quantity": quantityLabel.text!]
        
        if(!sizeStackView.isHidden){
            if let label = selectedSizeLabel{
                for size in sizes{
                    if(label.text == size.size){
                        params["size_id"] = size.id
                        break
                    }
                }
            }else{
                Alerts.showErrorAlert(view: self, title: "Error", message: "You must select size to procceed")
                return
            }
            
        }
        
        if(!colorStackView.isHidden){
            if let label = selectedColorLabel{
                for color in colors{
                    if(label.backgroundColor?.hexValue() == color.color){
                        params["color_id"] = color.id
                        break
                    }
                }
            }
        }else{
            Alerts.showErrorAlert(view: self, title: "Error", message: "You must select color to procceed")
            return
        }
        
        presenter.addToCart(params: params)
        
    }
    

    
}

extension ProductSpecificsViewController: CartViewDelegate{
    func onAddToCartSuccess(masterCart: CartMaster) {
        
    }
    
    func onGetCartSuccess(masterCart: CartMaster) {
        
    }
    
    func showError(message: String) {
        
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
        addToCartButton.isEnabled = false
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.startAnimating()
        addToCartButton.isEnabled = true
    }
}
