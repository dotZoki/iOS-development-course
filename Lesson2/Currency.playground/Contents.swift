//: Playground - noun: a place where people can play

import UIKit

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

class Convereter {
    
    static let exchangeRates: [String: Double] = [
        "USD-EUR": 0.88,
        "JPY-EUR": 0.0074,
        "CHF-EUR": 0.92,
    ]
    
    static func convert(value: Double, fromCurrency: Currency, toCurrency: Currency) throws -> (calculatedValue: Double, toCurrency: Currency, exchangeRate: String) {
        
        if let exchangeRate = Convereter.exchangeRates["\(fromCurrency.type)-\(toCurrency.type)"] {
            return (value / exchangeRate, toCurrency, "\(fromCurrency.type)-\(toCurrency.type): \(exchangeRate)")
        } else if let exchangeRate = Convereter.exchangeRates["\(toCurrency.type)-\(fromCurrency.type)"] {
            return (value * exchangeRate, toCurrency, "\(toCurrency.type)-\(fromCurrency.type): \(exchangeRate)")
        }
        
        throw CurrencyUnsuported.InvalidPair
        
    }
}

do {
    try Convereter.convert(100.22, fromCurrency: Currency(curencyName: "USD"), toCurrency: Currency(curencyName: "EUR"))
    try Convereter.convert(100, fromCurrency: Currency(curencyName: "EUR"), toCurrency: Currency(curencyName: "USD"))
    try Convereter.convert(1500, fromCurrency: Currency(curencyName: "JPY"), toCurrency: Currency(curencyName: "EUR"))
} catch CurrencyUnsuported.InvalidPair {
    print("Invalid Currency pair.")
}
