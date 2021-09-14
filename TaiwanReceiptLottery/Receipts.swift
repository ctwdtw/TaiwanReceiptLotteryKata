//
//  Receipt.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public class Receipt {
    let date: Date
    let price: Int
    let lotteryNumber: String
    
    init(
        date: Date,
        price: Int,
        lotteryNumber: String
    ) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
    }
}

public class B2BReceipt: Receipt {
    let taxID: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        taxID: String
    ) {
        self.taxID = taxID
        super.init(date: date, price: price, lotteryNumber: lotteryNumber)
    }
}

public class MobileBarCodeReceipt: Receipt {
    let mobileBarCode: String
    
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        mobileBarCode: String
    ) {
        self.mobileBarCode = mobileBarCode
        super.init(date: date, price: price, lotteryNumber: lotteryNumber)
    }
}

public class NPOCodeReceipt: Receipt {
    let npoCode: String
    public init(
        date: Date,
        price: Int,
        lotteryNumber: String,
        npoCode: String
    ) {
        self.npoCode = npoCode
        super.init(date: date, price: price, lotteryNumber: lotteryNumber)
    }
}

public class PrintedB2CReceipt: Receipt {
    public override init(
        date: Date,
        price: Int,
        lotteryNumber: String
    ) {
        super.init(date: date, price: price, lotteryNumber: lotteryNumber)
        
    }
}

