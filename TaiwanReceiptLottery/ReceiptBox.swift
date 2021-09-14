//
//  ReceiptBox.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public enum ReceiptBox {
    case b2b(B2BReceipt)
    case mobileBarCode(MobileBarCodeReceipt)
    case donated(DonatedReceipt)
    case printedB2C(PrintedB2CReceipt)
}
