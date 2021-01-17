//
//  Models.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//
import Foundation

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
public struct CommonB2CReceipt: Receipt {
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int) {
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}

// this is b2b receipt
public struct B2BReceipt: Receipt {
    let taxID: String
    private let companyName: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, taxID: String, companyName: String) {
        self.taxID = taxID
        self.companyName = companyName
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}

// this is a b2c receipt
public struct CachedReceipt: Receipt {
    let deviceID: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, deviceID: String) {
        self.deviceID = deviceID
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}

// this is a b2c receipt
public struct NonprofitOrgReceipt: Receipt {
    let organizationID: String
    public let commonFields: ReceiptCommonFields
    
    public init(lotteryNumber: String, date: Date, price: Int, organizationID: String) {
        self.organizationID = organizationID
        self.commonFields = ReceiptCommonFields(lotteryNumber: lotteryNumber, date: date, price: price)
    }
}
