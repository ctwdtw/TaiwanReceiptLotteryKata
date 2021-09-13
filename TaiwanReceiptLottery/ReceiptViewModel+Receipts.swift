//
//  ReceiptViewModel+Receipts.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/13.
//

import Foundation
extension ReceiptViewModel where ReceiptModel == B2BReceipt {
    public var title: String {
        return "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    public var footer: String {
        return "You can choose to print out this receipt or send it to your customer through email."
    }
}

extension ReceiptViewModel where ReceiptModel == MobileBarCodeReceipt {
    public var footer: String {
        return "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
}

extension ReceiptViewModel where ReceiptModel == DonatedReceipt {
    public var footer: String {
        return "The lottery opportunity has been donated to a non profit organization, the organization id is: \(receipt.npoID)"
    }
}

extension ReceiptViewModel where ReceiptModel == PrintedB2CReceipt {
    public var footer: String {
        return "The receipt has been printed."
    }
}
