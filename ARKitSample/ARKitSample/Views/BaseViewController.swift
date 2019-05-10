//
//  BaseViewController.swift
//  ARKitSample
//
//  Created by Marcelo Chaves on 10/05/19.
//  Copyright © 2019 Marcelo Chaves. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func showHud() {
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setDefaultMaskType(.custom)
//        SVProgressHUD.setForegroundColor(Colors.navigationBar) // Ring color
        DispatchQueue.main.async {
//            SVProgressHUD.show()
        }
    }
    
    public func hideHud() {
        DispatchQueue.main.async {
//            SVProgressHUD.dismiss()
        }
    }
    
    static func initFromStoryboard(named storyboardName: String) -> Self {
        return initFromStoryboardHelper(storyboardName: storyboardName)
    }
    
    private class func initFromStoryboardHelper<T>(storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let className = String(describing: self)
        let viewController = storyboard.instantiateViewController(withIdentifier: className) as! T
        return viewController
    }
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: handler)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}
