//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Leandro Yukio on 07/09/2018.
//  Copyright © 2018 Leandro Takahashi e Daniel Silva Santos. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    @IBOutlet weak var tfProductValue: UILabel!
    @IBOutlet weak var ivProductImage: UIImageView!
    var fetchedResultController: NSFetchedResultsController<Product>!
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Sua lista está vazia!"
        label.textAlignment = .center
        label.textColor = UIColor(named: "main")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadProducts() {
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = fetchedResultController.fetchedObjects?.count == 0 ? label : nil
        return fetchedResultController.fetchedObjects?.count ?? 0
    }
    
    @IBOutlet weak var lbCellProductName: UILabel!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductTableViewCell
        let product = fetchedResultController.object(at: indexPath)
        
        cell.lbCellProductName.text = product.name
        cell.ivProductImage.image = product.image as? UIImage
        cell.tfProductValue.text = String(product.value)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = fetchedResultController.object(at: indexPath)
            do {
                context.delete(product)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
extension TableViewController : NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}

