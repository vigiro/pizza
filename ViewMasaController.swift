//
//  ViewMasaController.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

protocol doughPizzaDelegate {
    func setPizzaDough(dough:String)
}

class ViewMasaController: UIViewController {
   
    @IBOutlet weak var delgada: UISwitch!
    @IBOutlet weak var crujiente: UISwitch!
    @IBOutlet weak var gruesa: UISwitch!
    
    var pizzaCheeseTmp:  Pizza?
    var delegate: doughPizzaDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDough()
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
    
    func setDough() {
        if let doughOld = pizzaCheeseTmp?.masa {
            switch doughOld {
            case "delgada":
                delgada.setOn(true, animated: true)
            case "crujiente":
                crujiente.setOn(true, animated: true)
            case "gruesa":
                gruesa.setOn(true, animated: true)
            default:
                delgada.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func setThin(sender: AnyObject) {
        crujiente.setOn(false, animated: true)
        gruesa.setOn(false, animated: true)
        setPizzaDough("delgada")
    }
    
    @IBAction func setCrisp(sender: AnyObject) {
        delgada.setOn(false, animated: true)
        gruesa.setOn(false, animated: true)
        setPizzaDough("Crujiente")
    }
    
    @IBAction func setThick(sender: AnyObject) {
        delgada.setOn(false, animated: true)
        crujiente.setOn(false, animated: true)
        setPizzaDough("gruesa")
    }
    
    func setPizzaDough(dough: String) {
        if delegate != nil {
            delegate!.setPizzaDough(dough)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
