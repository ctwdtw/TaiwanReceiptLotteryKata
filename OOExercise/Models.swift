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

public protocol ReceiptPresentable {
    func presentReceiptType() -> String
    func presentReceiptLotteryNumber() -> String
    func presentReceiptStatus() -> String
}

extension ReceiptPresentable where Self: Receipt {
    public func presentReceiptLotteryNumber() -> String {
        return commonFields.lotteryNumber
    }
    
    public func presentReceiptType() -> String {
        return "B2C receipt has been issued"
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt has been printed"
    }
}

public protocol Receipt {
    var commonFields: ReceiptCommonFields { get }
}

// common fields for all kinds of receipts
public struct ReceiptCommonFields {
    let lotteryNumber: String
    private let date: Date
    private let price: Int
    
    public init(lotteryNumber: String, date: Date, price: Int) {
        self.lotteryNumber = lotteryNumber
        self.date = date
        self.price = price
    }
}

// this is the a receipt with essential receipt fields, which is also a b2c receipt
public struct CommonB2CReceipt: Receipt & ReceiptPresentable {
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int) {
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}

// this is b2b receipt
public struct B2BReceipt: Receipt & ReceiptPresentable {
    private let taxID: String
    private let companyName: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, taxID: String, companyName: String) {
        self.taxID = taxID
        self.companyName = companyName
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
    
    public func presentReceiptType() -> String {
        return "B2B receipt has been issued"
    }
    
    public func presentReceiptStatus() -> String {
        return "choose to print out or send through email"
    }
}

// this is a b2c receipt
public struct CachedReceipt: Receipt & ReceiptPresentable {
    private let deviceID: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, deviceID: String) {
        self.deviceID = deviceID
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt is saved in device with device id: \(deviceID)"
    }
}

// this is a b2c receipt
public struct NonprofitOrgReceipt: Receipt & ReceiptPresentable {
    private let organizationID: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, organizationID: String) {
        self.organizationID = organizationID
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt lottery opportunity has been donated to non profile organization, org id: \(organizationID)"
    }
}
