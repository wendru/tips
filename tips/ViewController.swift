//
//  ViewController.swift
//  tips
//
//  Created by Andrew Wen on 2/1/15.
//  Copyright (c) 2015 wendru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var faceImage: UIImageView!
    var tipPercentages = [0.15, 0.18, 0.2]
    var faces = [
        UIImage(named: "really.png"),
        UIImage(named: "happy.jpg"),
        UIImage(named: "joy.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        tipControl.selectedSegmentIndex = 2;
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var index = tipControl.selectedSegmentIndex
        var tipPercentage = tipPercentages[index]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if(billAmount > 0) {
            faceImage.image = faces[index]
        } else {
            faceImage.image = nil
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

 