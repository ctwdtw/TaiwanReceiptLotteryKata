//
//  ReceiptViewModelsFactory.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public class ViewModelsFactory {
    public static func makeViewModels(_ receipts: [Receipt]) -> [ReceiptViewModel] {
        return receipts.compactMap { receipt in
            switch receipt {
            case let b2b as B2BReceipt:
                return AnyReceiptViewModel(b2b)
                
            case let mobile as MobileBarCodeReceipt:
                return AnyReceiptViewModel(mobile)
                
            case let npo as NPOCodeReceipt:
                return AnyReceiptViewModel(npo)
            
            case let b2c as PrintedB2CReceipt:
                return AnyReceiptViewModel(b2c)
            
            default:
                return nil
            }
        }
    }
}
