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

public struct B2BReceiptViewModel: ReceiptViewModel {
    public var title: String {
        "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    public var body: String {
        "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "You can choose to print out this receipt or send it to your customer through email."
    }
    
    private let receipt: B2BReceipt
    
    public init(_ receipt: B2BReceipt) {
        self.receipt = receipt
    }
    
}

public struct MobileBarCodeReceiptViewModel: ReceiptViewModel {
    public var title: String {
        "A B2C receipt has been issued."
    }
    
    public var body: String {
        "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
    
    private let receipt: MobileBarCodeReceipt
    
    public init(_ receipt: MobileBarCodeReceipt) {
        self.receipt = receipt
    }
    
}

public struct NPOReceiptViewModel: ReceiptViewModel {
    public var title: String {
        "A B2C receipt has been issued."
    }
    
    public var body: String {
        "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "The lottery opportunity has been donated to a non profit organization, the organization id is: \(receipt.npoCode)"
    }
    
    private let receipt: NPOCodeReceipt
    
    public init(_ receipt: NPOCodeReceipt) {
        self.receipt = receipt
    }
    
}

public struct PrintedB2CReceiptViewModel: ReceiptViewModel {
    public var title: String {
        "A B2C receipt has been issued."
    }
    
    public var body: String {
        "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        "The receipt has been printed."
    }
    
    private let receipt: PrintedB2CReceipt
    
    public init(_ receipt: PrintedB2CReceipt) {
        self.receipt = receipt
    }
}
