//
//  ReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/13.
//

import Foundation
public struct ReceiptViewModel<ReceiptModel: Receipt> {
    let receipt: ReceiptModel
    
    public var title: String {
        return "A B2C receipt has been issued."
    }
    
    public var body: String {
        return "The lottery number is \(receipt.data.lotteryNumber)."
    }
    
    public init(_ receipt: ReceiptModel) {
        self.receipt = receipt
    }
}


