//
//  BrainTipsy.swift
//  Tipsy
//
//  Created by Mauricio Dias on 17/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var tipsy: Tipsy?
    var result: Float?
    
    
    mutating func calculateTips(value: Float, nroPeople: Int, perc: Float) {
        tipsy = Tipsy(billValue: value, numberPeople: nroPeople, percent: perc)
        let valuePerPerson = (getBillValue()/Float(getNumberPeople()))
        result = valuePerPerson + (valuePerPerson * getPerc())
    }
    
    func getPerc() -> Float {
        return tipsy?.percent ?? 0.0
    }
    
    func getNumberPeople() -> Int {
        return tipsy?.numberPeople ?? 0
    }
    
    func getBillValue() -> Float {
        return tipsy?.billValue ?? 0.0
    }
    
    func getResult() -> Float {
        return result ?? 0.0
    }
}
