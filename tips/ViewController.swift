//
//  ViewController.swift
//  tips
//
//  Created by Alex Choi on 8/30/14.
//  Copyright (c) 2014 Alex Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var dividerView: UIView!

    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.text = "0"

        self.loadSettings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func viewWillAppear(animated: Bool) {
        loadSettings()
    }

    func loadSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var selectedTipIndex = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = selectedTipIndex

        var selectedTheme = defaults.integerForKey("themeIndex")

        switch(selectedTheme) {
        case 0:
            self.view.backgroundColor   = .whiteColor()
            billAmountLabel.textColor   = .blackColor()
            billField.textColor         = .blackColor()
            billField.backgroundColor   = .whiteColor()
            tipTextLabel.textColor      = .blackColor()
            tipLabel.textColor          = .blackColor()
            dividerView.backgroundColor = .blackColor()
            totalTextLabel.textColor    = .blackColor()
            totalLabel.textColor        = .blackColor()
        case 1:
            self.view.backgroundColor   = .blackColor()
            billAmountLabel.textColor   = .whiteColor()
            billField.textColor         = .whiteColor()
            billField.backgroundColor   = .blackColor()
            tipTextLabel.textColor      = .whiteColor()
            tipLabel.textColor          = .whiteColor()
            dividerView.backgroundColor = .whiteColor()
            totalTextLabel.textColor    = .whiteColor()
            totalLabel.textColor        = .whiteColor()
        default:
            println("invalid theme stored")
        }
    }
}

