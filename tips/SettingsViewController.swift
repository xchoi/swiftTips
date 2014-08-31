//
//  SettingsViewController.swift
//  tips
//
//  Created by Alex Choi on 8/30/14.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!


    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var selectedTipIndex = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = selectedTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    @IBAction func doneButtonPushed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, nil)
    }

}
