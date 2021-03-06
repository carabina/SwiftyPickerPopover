//
//  AbstractPopover.swift
//  SwiftyPickerPopover
//
//  Created by Y.T. Hoshino on 2016/09/14.
//  Copyright © 2016 Yuta Hoshino. All rights reserved.
//

import Foundation
import UIKit

class AbstractPopover:NSObject {
    
    /// configure navigationController
    /// - parameter originView: origin view of Popover
    /// - parameter baseViewController: viewController to become the base
    /// - parameter title: title of navigation bar
    func configureNavigationController(originView: UIView, baseViewController: UIViewController, title: String?)->UINavigationController?{
        // create ViewController for content
        let storyboard = UIStoryboard(name: self.storyboardName(), bundle: nil)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController else {
            return nil
        }
        
        // define using popover
        navigationController.modalPresentationStyle = .Popover
        
        // origin
        navigationController.popoverPresentationController?.sourceView = baseViewController.view
        navigationController.popoverPresentationController?.sourceRect = originView.frame
        
        // direction of arrow
        navigationController.popoverPresentationController?.permittedArrowDirections = .Any
        
        // navigationItem's title
        navigationController.topViewController!.navigationItem.title = title
        
        return navigationController
    }
    
    /// storyboardName
    func storyboardName()->String{
        return "StringPickerPopover"
    }

}