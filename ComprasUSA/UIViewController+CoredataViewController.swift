//
//  UIViewController+CoredataViewController.swift
//  ComprasUSA
//
//  Created by Leandro Yukio on 07/09/2018.
//  Copyright © 2018 Leandro Takahashi e Daniel Silva Santos. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
