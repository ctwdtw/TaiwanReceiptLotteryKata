//
//  ReceiptViewModelFactory.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public class ReceiptViewModelFactory {
    static public func makeViewModes(from boxedReceipts: [ReceiptBox]) -> [AnyReceiptViewModel] {
        boxedReceipts.map { receiptBox in
            switch receiptBox {
            case .b2b(let receipt):
                return AnyReceiptViewModel(vm: ReceiptViewModel(receipt))
                
            case .mobileBarCode(let receipt):
                return AnyReceiptViewModel(vm: ReceiptViewModel(receipt))
                
            case .donated(let receipt):
                return AnyReceiptViewModel(vm: ReceiptViewModel(receipt))
                
            case .printedB2C(let receipt):
                return AnyReceiptViewModel(vm: ReceiptViewModel(receipt))
                
            }
        }
    }
}
