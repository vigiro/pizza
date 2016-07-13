//
//  ViewTamañoController.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

protocol sizePizzaDelegate {
    func setPizzaSize(size:String)
}


class ViewTaman_oController: UIViewController {

    var pizzaCheeseTmp:  Pizza?
    var delegate: sizePizzaDelegate? = nil
    
    @IBOutlet weak var chica: UISwitch!
   
    @IBOutlet weak var mediana: UISwitch!
    
    @IBOutlet weak var grande: UISwitch!
    
    //    var viewMain = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSize()
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
    
    func setSize() {
        if let sizeOld = pizzaCheeseTmp?.tamaño {
            switch sizeOld {
            case "chica":
                chica.setOn(true, animated: true)
            case "Mediana":
                mediana.setOn(true, animated: true)
            case "grande":
                grande.setOn(true, animated: true)
            default:
                chica.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func switchSmall(sender: AnyObject) {
        mediana.setOn(false, animated: true)
        grande.setOn(false, animated: true)
        setPizzaSize("chica")
    }
    @IBAction func switchMedian(sender: AnyObject) {
        chica.setOn(false, animated: true)
        grande.setOn(false, animated: true)
        setPizzaSize("Mediana")
    }
    
    @IBAction func switchBig(sender: AnyObject) {
        chica.setOn(false, animated: true)
        mediana.setOn(false, animated: true)
        setPizzaSize("grande")
    }
    
    func setPizzaSize(size: String) {
        if delegate != nil {
            delegate!.setPizzaSize(size)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
