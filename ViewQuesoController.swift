//
//  ViewQuesoController.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

protocol cheesePizzaDelegate {
    func setPizzaCheese(cheese:String)
}


class ViewQuesoController: UIViewController {
    
    @IBOutlet weak var mozarela: UISwitch!
    @IBOutlet weak var cheddar: UISwitch!
    @IBOutlet weak var parmesano: UISwitch!
    @IBOutlet weak var sinQueso: UISwitch!
    
    var pizzaCheeseTmp:  Pizza?
    // Stept: 2
    var delegate: cheesePizzaDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCheese()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func setCheese() {
        if let cheeseOld = pizzaCheeseTmp?.queso {
            switch cheeseOld {
            case "Mozzarella":
                mozarela.setOn(true, animated: true)
            case "Cheddar":
                cheddar.setOn(true, animated: true)
            case "Parmesan":
                parmesano.setOn(true, animated: true)
            case "No Cheese":
                sinQueso.setOn(true, animated: true)
            default:
                sinQueso.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func setMozzarella(sender: AnyObject) {
        cheddar.setOn(false, animated: true)
        parmesano.setOn(false, animated: true)
        sinQueso.setOn(false, animated: true)
        setPizzaCheese("Mozzarella");
    }
    
    
    @IBAction func setChedar(sender: AnyObject) {
        mozarela.setOn(false, animated: true)
        parmesano.setOn(false, animated: true)
        sinQueso.setOn(false, animated: true)
        setPizzaCheese("Cheddar");
    }
    
    @IBAction func setParmesan(sender: AnyObject) {
        mozarela.setOn(false, animated: true)
        cheddar.setOn(false, animated: true)
        sinQueso.setOn(false, animated: true)
        setPizzaCheese("Parmesan");
    }
    
    @IBAction func setNoCheese(sender: AnyObject) {
        mozarela.setOn(false, animated: true)
        cheddar.setOn(false, animated: true)
        parmesano.setOn(false, animated: true)
        setPizzaCheese("No Cheese");
    }
    
    func setPizzaCheese(cheese: String) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaCheese(cheese)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
}
