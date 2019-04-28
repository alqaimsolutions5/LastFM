//
//  BaseVC.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Alerts
    
    /// Show alert with two buttons
    ///
    /// - Parameters:
    ///   - title: title of alert
    ///   - message: description of alert
    ///   - firstTitle: title of first button
    ///   - secondTitle: title of second button
    ///   - firstHandler: handler for first button
    ///   - secondHandler: handler for second button
    
    @objc func showTwoButtonsAlert (title:String, message:String, firstTitle:String, secondTitle:String, firstHandler:((UIAlertAction) -> Void)?, secondHandler:((UIAlertAction) -> Void)?){
        
        let alertController = UIAlertController(title:title, message:message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstTitle, style: UIAlertAction.Style.default, handler: firstHandler)
        let secondAction = UIAlertAction(title: secondTitle, style: UIAlertAction.Style.cancel, handler: secondHandler)
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// Show Simple alert
    ///
    /// - Parameters:
    ///   - title: title of  alert
    ///   - andMsg: description of alert
    ///   - andHandler: handler on button pressed
    @objc func showAlertWithTitle(title:String, andMsg:String, andHandler: ((UIAlertAction) -> Void)?) -> Void {
        let alertController = UIAlertController(title: title, message:andMsg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: andHandler)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func showHUD(title:String?) -> Void {
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = title ?? Constants.Loading
    }
    
    // MARK: - Loader
    
    @objc func hideHUD() -> Void {
        MBProgressHUD.hide(for: self.view, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
