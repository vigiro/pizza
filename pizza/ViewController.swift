//
//  ViewController.swift
//  pizza
//
//  Created by vidal romero  on 06/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

class ViewController: UIViewController, sizePizzaDelegate, doughPizzaDelegate, cheesePizzaDelegate, ingredientsPizzaDelegate, orderPizzaDelegate {

   
    @IBOutlet weak var btnSize: UIButton!
    @IBOutlet weak var btnDough: UIButton!
    @IBOutlet weak var btnCheese: UIButton!
    @IBOutlet weak var btnIngredients: UIButton!
    
    var customPizza: Pizza = Pizza()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SizePizza" {
            let secondView:ViewTaman_oController = segue.destinationViewController as! ViewTaman_oController
            secondView.pizzaCheeseTmp = customPizza
            secondView.delegate = self
        }else if segue.identifier == "KindDough" {
            let doughView:ViewMasaController = segue.destinationViewController as! ViewMasaController
            doughView.pizzaCheeseTmp = customPizza
            doughView.delegate = self
        }else if segue.identifier == "KindCheese" {
            let cheeseView:ViewQuesoController = segue.destinationViewController as! ViewQuesoController
            cheeseView.pizzaCheeseTmp = customPizza
            cheeseView.delegate = self
        }else if segue.identifier == "Ingredients" {
            let ingredientsView:ViewIngredientesController = segue.destinationViewController as! ViewIngredientesController
            ingredientsView.pizzaIngredientsTmp = customPizza
            ingredientsView.delegate = self
        }
    }
    
    func showAlertMessage (title: String, message: String, owner:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler:{ (ACTION :UIAlertAction!)in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnConfirmOrder(sender: AnyObject) {
        if validateSelectionSteps(){
            let viewConfirmOrder = self.storyboard?.instantiateViewControllerWithIdentifier("ConfirmOrder") as? ViewOrdenController
            viewConfirmOrder!.delegate = self
            viewConfirmOrder!.orderPizza = customPizza
            self.navigationController?.pushViewController(viewConfirmOrder!, animated: true)
            
        }else {
            showAlertMessage("Warning", message: "Necesita seleccionar todos los ingredientes", owner: self)
        }
    }
    
    func validateSelectionSteps() -> Bool{
        if (customPizza.tamaño != nil && customPizza.masa != nil && customPizza.queso != nil && customPizza.ingredientes.count != 0) {
            return true
        }
        return false
    }
    
    func setPizzaSize(size: String) {
        customPizza.tamaño = size
    }
    
    func setPizzaDough(dough: String) {
        customPizza.masa = dough
    }
    
    
    func setPizzaCheese(cheese: String){
        customPizza.queso = cheese
    }
    
    func setPizzaIngredients(ingredients: [String: String]) {
        customPizza.ingredientes = ingredients
    }
    
    func newOrder() {
        customPizza.tamaño = nil
        customPizza.masa = nil
        customPizza.queso = nil
        customPizza.ingredientes = [String: String]()
    }
}

