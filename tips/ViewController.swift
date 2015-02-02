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
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var tipPercentages = [15, 18, 20]
    var faces = [
        UIImage(named: "really.png"),
        UIImage(named: "happy.jpg"),
        UIImage(named: "joy.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadPresets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        tipControl.selectedSegmentIndex = 2;
    }
    
    func loadPresets() {
        if(defaults.boolForKey("custom_presets")) {
            tipPercentages = [
                defaults.integerForKey("option1"),
                defaults.integerForKey("option2"),
                defaults.integerForKey("option3")
            ]
            
            tipControl.setTitle("\(tipPercentages[0])%", forSegmentAtIndex: 0)
            tipControl.setTitle("\(tipPercentages[1])%", forSegmentAtIndex: 1)
            tipControl.setTitle("\(tipPercentages[2])%", forSegmentAtIndex: 2)
        }
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var index = tipControl.selectedSegmentIndex
        var tipPercentage = Double(tipPercentages[index]) / 100
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

 