//
//  Receipt.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public struct B2BReceipt: Receipt {
    let taxID: String
    public let date: Date
    public let price: Int
    public let lotteryNumber: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        taxID: String
    ) {
        self.taxID = taxID
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        
    }
}

public struct MobileBarCodeReceipt: Receipt {
    let mobileBarCode: String
    public let date: Date
    public let price: Int
    public let lotteryNumber: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        mobileBarCode: String
    ) {
        self.mobileBarCode = mobileBarCode
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
    }
}

public struct NPOCodeReceipt: Receipt {
    let npoCode: String
    public let date: Date
    public let price: Int
    public let lotteryNumber: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        npoCode: String
    ) {
        self.npoCode = npoCode
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
    }
}

public struct PrintedB2CReceipt: Receipt {
    public let date: Date
    public let price: Int
    public let lotteryNumber: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String
    ) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
    }
}

