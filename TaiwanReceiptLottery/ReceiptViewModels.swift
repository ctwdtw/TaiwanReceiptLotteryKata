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

/// used to hide the default implementation of `ReceiptViewModel`
private protocol ReceiptViewModelIMP {
    var receipt: Receipt { get }
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

public struct B2BReceiptViewModel: ReceiptViewModel, ReceiptViewModelIMP {
    var receipt: Receipt {
        return _receipt
    }
    
    public var title: String {
        "A B2B receipt has been issued, the company tax id is \(_receipt.taxID)."
    }
    
    public var footer: String {
        "You can choose to print out this receipt or send it to your customer through email."
    }
    
    private let _receipt: B2BReceipt
    
    public init(_ receipt: B2BReceipt) {
        self._receipt = receipt
    }
    
}

public struct MobileBarCodeReceiptViewModel: ReceiptViewModel, ReceiptViewModelIMP {
    var receipt: Receipt {
        _receipt
    }
    
    public var footer: String {
        "The receipt is saved in cloud database with mobile barcode number: \(_receipt.mobileBarCode)"
    }
    
    private let _receipt: MobileBarCodeReceipt
    
    public init(_ receipt: MobileBarCodeReceipt) {
        self._receipt = receipt
    }
    
}

public struct NPOReceiptViewModel: ReceiptViewModel, ReceiptViewModelIMP {
    var receipt: Receipt {
        _receipt
    }
    
    public var footer: String {
        "The lottery opportunity has been donated to a non profit organization, the organization id is: \(_receipt.npoCode)"
    }
    
    private let _receipt: NPOCodeReceipt
    
    public init(_ receipt: NPOCodeReceipt) {
        self._receipt = receipt
    }
    
}

public struct PrintedB2CReceiptViewModel: ReceiptViewModel, ReceiptViewModelIMP {
    var receipt: Receipt {
        _receipt
    }
    
    private let _receipt: PrintedB2CReceipt
    
    public init(_ receipt: PrintedB2CReceipt) {
        self._receipt = receipt
    }
}
