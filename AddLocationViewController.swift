//
//  AddLocationViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Matt Amerige on 7/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

protocol AddLocationViewControllerDelegate: class {
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController)
    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool
    func addLocationViewController(viewController: AddLocationViewController, didAddLocationNamed name: String)
}

class AddLocationViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    
    weak var delegate: AddLocationViewControllerDelegate?
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        guard let text = textfield.text else { return }
        
        if delegate?.addLocationViewController(self, shouldAllowLocationNamed: text) == true {
           delegate?.addLocationViewController(self, didAddLocationNamed: text)
        }
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        delegate?.addLocationViewControllerDidCancel(self)
    }
}
