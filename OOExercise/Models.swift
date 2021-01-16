//
//  Models.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

/*
 In Taiwan, in order to prevent tax evasion, the government ask big merchant to give
 a receipt with a government assigned number to the consumer when a transaction is done.

 If merchants honestly give consumers receipts with government assigned numbers,
 the government can track supposed tax amount with those numbers
 
 In order to encourage consumers to ask receipts from merchants,
 the government turn the assigned number to the so called Taiwan Receipt Lottery Number.
 
 Here is a simplified version for the actual requirements for the receipt:
 
 Each receipt has the following fields:
 1. date
 2. price
 3. lottery number
 
 , and some extras based on the type of the receipt:
 
 b2b receipt can be sent through email or print out.
 b2c receipt can be print out or cached in a device with device id.
 b2c receipt can be denote to nonprofit organization for the Taiwan Receipt Lottery opportunity.
 
 This project is an exercise of using OOP to model such requirement.
 */

import Foundation
class Receipt {
    let lotteryNumber: String
    let date: Date
    let price: Int
    
    init(lotteryNumber: String, date: Date, price: Int) {
        self.lotteryNumber = lotteryNumber
        self.date = date
        self.price = price
    }
}

class B2BReceipt: Receipt {
    let taxID: String
    let companyName: String
    
    init(lotteryNumber: String, date: Date, price: Int, taxID: String, companyName: String) {
        self.taxID = taxID
        self.companyName = companyName
        super.init(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}

// this is a b2c receipt
class CachedReceipt: Receipt {
    let deviceID: String
    
    init(lotteryNumber: String, date: Date, price: Int, deviceID: String) {
        self.deviceID = deviceID
        super.init(lotteryNumber: lotteryNumber, date: date, price: price)
    }
    
}

// this is a b2c receipt
class NonprofitOrgReceipt: Receipt {
    let organizationID: String
    
    init(lotteryNumber: String, date: Date, price: Int, organizationID: String) {
        self.organizationID = organizationID
        super.init(lotteryNumber: lotteryNumber, date: date, price: price)
    }
    
}
