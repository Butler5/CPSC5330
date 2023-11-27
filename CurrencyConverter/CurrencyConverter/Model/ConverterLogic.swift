//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by Adam Butler on 11/25/23.
//

import Foundation

struct ConverterLogic{
    var eurRate: Double = 0.82
    var gbpRate: Double = 0.71
    var mxnRate: Double = 20.29
    var cadRate: Double = 1.26
    
    var eurSwitch = true
    var gbpSwitch = true
    var mxnSwitch = true
    var cadSwitch = true
    
    var amount: Double = 0
    
    mutating func setSwitch(_ switchValue: Bool){
        if switchValue {
            eurSwitch = true
            gbpSwitch = true
            mxnSwitch = true
            cadSwitch = true
            
        } else {
            eurSwitch = false
            gbpSwitch = false
            mxnSwitch = false
            cadSwitch = false
            
        }
                
        
    }

    mutating func getEurConversion(_ amount: Double) -> Double {
        let eurValue = Double(amount * eurRate)
        return eurValue
    }
    
    mutating func getGbpConversion(_ amount: Double) -> Double {
        let gbpValue = Double(amount * gbpRate)
        return gbpValue
    }
    
    mutating func getMxnConversion(_ amount: Double) -> Double {
        let mxnValue = Double(amount * mxnRate)
        return mxnValue
    }
    
    mutating func getCadConversion(_ amount: Double) -> Double {
        let cadValue = Double(amount * cadRate)
        return cadValue
    }
    
    mutating func convertAmount(_ amount: Double) -> String {
        var conversionResults = ""
        if eurSwitch {
            let euroValue = getEurConversion(amount)
            conversionResults += "EUR: \(euroValue)\n"
        }
        if gbpSwitch {
            let gbpValue = getGbpConversion(amount)
            conversionResults += "GBP: \(gbpValue)\n"
        }
        if mxnSwitch {
            let mxnValue = getMxnConversion(amount)
            conversionResults += "MXN: \(mxnValue)\n"
        }
        
        if cadSwitch {
            let cadValue = getCadConversion(amount)
            conversionResults += "CAD: \(cadValue)\n"
        } else {
            conversionResults = "NOT VALID"
        }
        return conversionResults
        
    }
}

