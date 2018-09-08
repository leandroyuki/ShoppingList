//
//  ProductResgisterViewController.swift
//  ComprasUSA
//
//  Created by Leandro Yukio on 07/09/2018.
//  Copyright © 2018 Leandro Takahashi e Daniel Silva Santos. All rights reserved.
//

import UIKit

class ProductResgisterViewController: UIViewController {
    var product: Product!
    var states: NSSet?
    var state: State? = nil
    
    @IBAction func btnAddState(_ sender: UIButton) {
        
      
    }
    @IBOutlet weak var tfProductName: UITextField!
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var tfState: UITextField!
    @IBOutlet weak var tfProductValue: UITextField!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBAction func btOptIn(_ sender: UIButton) {
        
        if product == nil {
            product = Product(context: context)
        }
        product.name = tfProductName.text!
        product.value = Double(tfProductValue.text!)!
        product.image = ivProduct.image
        product.creditCard = swCreditCard.isOn
        
        state?.name = "Adicionar"
        state?.tax = 1.1
        
        product.state = state
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivProduct.image = #imageLiteral(resourceName: "images")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
