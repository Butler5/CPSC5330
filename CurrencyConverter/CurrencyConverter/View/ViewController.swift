//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Adam Butler on 11/25/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var gbpSwith: UISwitch!
    @IBOutlet weak var mxnSwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    
    var converterLogic = ConverterLogic()
    var amount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func EURSlider(_ sender: UISwitch) {
        converterLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func GBPSlider(_ sender: UISwitch) {
        converterLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func MXNSlider(_ sender: UISwitch) {
        converterLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func CADSlider(_ sender: UISwitch) {
        converterLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        let amount = Double(textField.text ?? "0") ?? 0.0
        let result = converterLogic.convertAmount(amount)
        
        let alert = UIAlertController(title: "Conversion Result", message: result, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        self.amount = result
        self.performSegue(withIdentifier: "toConverterView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConverterView" {
            let navigation = segue.destination as! ConverterView
            navigation.amount = amount
        }
    }
    
}

