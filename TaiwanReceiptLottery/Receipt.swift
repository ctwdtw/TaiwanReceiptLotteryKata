//
//  Receipt.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public struct Receipt {
    public enum SpecialFieldBox {
        case taxID(String)
        case mobileBarCode(String)
        case npoCode(String)
        case non
    }
    
    let date: Date
    let price: Int
    let lotteryNumber: String
    let specialField: SpecialFieldBox
    
    public init(date: Date, price: Int, lotteryNumber: String, specialField: SpecialFieldBox) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        self.specialField = specialField
    }
}
