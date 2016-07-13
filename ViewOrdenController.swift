//
//  ViewOrdenController.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

protocol orderPizzaDelegate {
    func newOrder()
}


class ViewOrdenController: UIViewController {

    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblDough: UILabel!
    @IBOutlet weak var lblCheese: UILabel!
    @IBOutlet weak var txtViewIngredients: UITextView!
    @IBOutlet weak var lblConfirm: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnNewOrder: UIButton!
    var delegate: orderPizzaDelegate? = nil
    var orderPizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showOrder() {
        lblSize.text = orderPizza?.tamaño
        lblDough.text = orderPizza?.masa
        lblCheese.text = orderPizza?.queso
        /*var ingredients: String = ""
        for (_,value) in (orderPizza?.ingredientes)! {
            ingredients += "\(value)\n"
        }
        let index1 = ingredients.substringToIndex(ingredients.endIndex.predecessor())
        txtViewIngredients.text = index1
        print(ingredients)*/
    }
    
    @IBAction func btnAccept(sender: AnyObject) {
        print("Send kitchen")
        showAlertMessage("Confirm", message: "Confirm to send your order to the kitchen", owner: self)
    }
    
    @IBAction func btnCancel(sender: AnyObject) {
        print("Edit or cancel")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func showAlertMessage (title: String, message: String, owner:UIViewController) {
        //        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler:{ (ACTION:UIAlertAction!)in
            self.lblConfirm.text = "Your order has been sent to the kitchen"
            self.btnCancel.hidden = true
            self.btnAccept.hidden = true
            self.btnNewOrder.hidden = false
            //print("User click Accept button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:{ (ACTION:UIAlertAction!)in
            //print("User click Cancel button")
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func createNewOrder(sender: AnyObject) {
        if delegate != nil {
            delegate!.newOrder()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
