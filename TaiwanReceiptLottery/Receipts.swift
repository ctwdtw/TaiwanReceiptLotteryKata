//
//  Receipts.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/13.
//

import Foundation

public struct B2BReceipt: Receipt {
    public let data: ReceiptData
    private(set) var taxID: String
    
    public init(date: Date, price: Int, lotteryNumber: String, taxID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.taxID = taxID
    }
}

public struct MobileBarCodeReceipt: Receipt {
    private(set) var mobileBarCode: String
    public let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, mobileBarCode: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.mobileBarCode = mobileBarCode
    }
}

public struct DonatedReceipt: Receipt {
    private(set) var npoID: String
    public let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, npoID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.npoID = npoID
    }
}

public struct PrintedB2CReceipt: Receipt {
    public let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
    }
}

public protocol Receipt {
    var data: ReceiptData { get }
}

public struct ReceiptData {
    private var date: Date
    private var price: Int
    let lotteryNumber: String
    
    init(date: Date, price: Int, lotteryNumber: String) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
    }
}
