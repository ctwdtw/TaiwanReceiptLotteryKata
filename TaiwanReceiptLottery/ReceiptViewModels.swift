//
//  ReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation

public struct AnyReceiptViewModel<Model: Receipt>: ReceiptViewModel {
    public var title: String {
        "A B2C receipt has been issued."
    }
    
    public var body: String {
        return "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "The receipt has been printed."
    }
    
    private let receipt: Model
    
    public init(_ receipt: Model) {
        self.receipt = receipt
    }
}

extension AnyReceiptViewModel where Model == B2BReceipt {
    public var title: String {
        "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    public var footer: String {
        "You can choose to print out this receipt or send it to your customer through email."
    }
}

extension AnyReceiptViewModel where Model == MobileBarCodeReceipt {
    public var footer: String {
        "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
}

extension AnyReceiptViewModel where Model == NPOCodeReceipt {
    public var footer: String {
        "The lottery opportunity has been donated to a non profit organization, the organization id is: \(receipt.npoCode)"
    }
}

extension AnyReceiptViewModel where Model == PrintedB2CReceipt {}
