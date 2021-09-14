//
//  ReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public protocol ReceiptViewModel {
    var title: String { get }
    var body: String { get }
    var footer: String { get }
}

extension ReceiptViewModel {
    public var title: String {
        "A B2C receipt has been issued."
    }
    
    public var body: String {
        let `self` = self as! ReceiptViewModelIMP
        return "The lottery number is \(`self`.receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "The receipt has been printed."
    }
}

/// used to hide the default implementation of `ReceiptViewModel`
protocol ReceiptViewModelIMP {
    var receipt: Receipt { get }
}

