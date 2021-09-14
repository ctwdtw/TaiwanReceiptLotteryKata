//
//  ReceiptViewModelsFactory.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public class ViewModelsFactory {
    public static func makeViewModels(_ receipts: [Receipt]) -> [ReceiptViewModel] {
        receipts.map { ReceiptViewModel($0) }
    }
}
