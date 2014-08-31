//
//  SettingsViewController.swift
//  tips
//
//  Created by Alex Choi on 8/30/14.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!

    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var themeControl: UISegmentedControl!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var selectedTipIndex = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = selectedTipIndex

        var selectedThemeIndex = defaults.integerForKey("themeIndex")
        themeControl.selectedSegmentIndex = selectedThemeIndex

        self.themeChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.setInteger(themeControl.selectedSegmentIndex, forKey: "themeIndex")
        defaults.synchronize()
    }

    @IBAction func doneButtonPushed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, nil)
    }

    @IBAction func themeChanged(sender: AnyObject) {
        switch (themeControl.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = .whiteColor()
            tipLabel.textColor = .blackColor()
            themeLabel.textColor = .blackColor()
        case 1:
            self.view.backgroundColor = .blackColor()
            tipLabel.textColor = .whiteColor()
            themeLabel.textColor = .whiteColor()
        default:
            println("warning: segment control too large")
        }
    }
}
