//
//  Receipt.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public protocol Receipt {
    var date: Date { get }
    var price: Int { get }
    var lotteryNumber: String { get }
}
