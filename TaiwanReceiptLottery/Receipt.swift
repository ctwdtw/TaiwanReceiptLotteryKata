//
//  Receipt.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/13.
//

import Foundation
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
