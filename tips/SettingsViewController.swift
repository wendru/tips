//
//  SettingsViewController.swift
//  tips
//
//  Created by Andrew Wen on 2/2/15.
//  Copyright (c) 2015 wendru. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var optField1: UITextField!
    @IBOutlet weak var optField2: UITextField!
    @IBOutlet weak var optField3: UITextField!

    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadStepperConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadStepperConfig() {
        if(defaults.boolForKey("custom_presets")) {
            optField1.text = String(defaults.integerForKey("option1"))
            optField2.text = String(defaults.integerForKey("option2"))
            optField3.text = String(defaults.integerForKey("option3"))
        } else {
            optField1.text = "15"
            optField2.text = "18"
            optField3.text = "20"
        }
    }

    @IBAction func done(sender: AnyObject) {
        savePresets()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func savePresets() {
        var opt1 = optField1.text.toInt()!
        var opt2 = optField2.text.toInt()!
        var opt3 = optField3.text.toInt()!
        
        defaults.setInteger(opt1, forKey: "option1")
        defaults.setInteger(opt2, forKey: "option2")
        defaults.setInteger(opt3, forKey: "option3")
        defaults.setBool(true, forKey: "custom_presets")
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
