//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit
import CoreLocation

class Currency {
    
    private var type: String
    
    init(curencyName: String) {
        self.type = curencyName.uppercaseString
    }
    
    func getType() -> String {
        return self.type
    }
}

enum CurrencyUnsuported: ErrorType {
    case InvalidPair
}

extension Double {
    
    func convert(fromCurrency: Currency, toCurrency: Currency) throws -> (calculatedValue: Double, toCurrency: Currency, exchangeRate: String) {
        
        return try Converter.instannce.convert(self, fromCurrency: fromCurrency, toCurrency: toCurrency)
    }
}

final class Converter {
    static let instannce = Converter()
    
    private init() {
    }
    
    static let exchangeRates: [String: Double] = [
        "USD-EUR": 0.88,
        "JPY-EUR": 0.0074,
        "CHF-EUR": 0.92,
    ]
    
    func convert(value: Double, fromCurrency: Currency, toCurrency: Currency) throws -> (calculatedValue: Double, toCurrency: Currency, exchangeRate: String) {
        
        if let exchangeRate = Converter.exchangeRates["\(fromCurrency.type)-\(toCurrency.type)"] {
            return (value * exchangeRate, toCurrency, "\(fromCurrency.type)-\(toCurrency.type): \(exchangeRate)")
        } else if let exchangeRate = Converter.exchangeRates["\(toCurrency.type)-\(fromCurrency.type)"] {
            return (value / exchangeRate, toCurrency, "\(toCurrency.type)-\(fromCurrency.type): \(exchangeRate)")
        }
        
        throw CurrencyUnsuported.InvalidPair
        
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyUsd: UIButton!
    @IBOutlet weak var currencyJpy: UIButton!
    @IBOutlet weak var conversionText: UILabel!
    @IBOutlet weak var convertValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyUsd.selected = true
        currencyJpy.selected = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectCurrencyUsd(sender: UIButton) {
        sender.selected = true
        currencyJpy.selected = false
    }
    
    
    @IBAction func selectCurrencyJpy(sender: UIButton) {
        sender.selected = true
        currencyUsd.selected = false
    }
    
    @IBAction func converToEur(sender: UIButton) {
        var currency: Currency
        
        switch true {
        case currencyJpy.selected:
            currency = Currency(curencyName: "JPY")
        default:
            currency = Currency(curencyName: "USD")
        }
        
        if let cValue = Double(convertValue.text!) {
            convertValue.text = String(format:"%.2f", cValue)
            
            do {
                let conversionResult:(Double, Currency, String) = try cValue.convert(currency, toCurrency: Currency(curencyName: "EUR"))
                let resultValue: String = String(format:"%.2f", conversionResult.0)
                conversionText.text = "\(convertValue.text!) \(currency.getType()) is \(resultValue) EUR"
            } catch CurrencyUnsuported.InvalidPair {
                UIAlertView(title: "Wrong input", message: "Input is not OK", delegate: nil, cancelButtonTitle: "OK").show()
            } catch {
                UIAlertView(title: "?", message: "Something went wrong ...", delegate: nil, cancelButtonTitle: "OK").show()
            }
        } else {
            UIAlertView(title: "?", message: "Did you input valid double?", delegate: nil, cancelButtonTitle: "OK").show()
        }
        
        
    }
    @IBAction func selectCurrency(sender: UIButton) {
        let manager = CLLocationManager()
    }
}

