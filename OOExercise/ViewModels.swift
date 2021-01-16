//
//  ViewModel.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import Foundation
public protocol ReceiptPresentable {
    var receipt: Receipt { get }
    func presentReceiptType() -> String
    func presentReceiptLotteryNumber() -> String
    func presentReceiptStatus() -> String
}

extension ReceiptPresentable {
    public func presentReceiptType() -> String {
        return "B2C receipt has been issued"
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
}

public struct CommonB2CReceiptViewModel: ReceiptPresentable {
    public let receipt: Receipt
    
    public init(receipt: CommonB2CReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt has been printed"
    }
}

public struct NonprofitOrgReceiptViewModel: ReceiptPresentable {
    public let receipt: Receipt
    
    public init(receipt: NonprofitOrgReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptStatus() -> String {
        let r = receipt as! NonprofitOrgReceipt
        return "receipt lottery opportunity has been donated to non profile organization, org id: \(r.organizationID)"
    }
}

public struct CachedReceiptViewModel: ReceiptPresentable {
    public let receipt: Receipt
    
    public init(receipt: CachedReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptStatus() -> String {
        let r = receipt as! CachedReceipt
        return "receipt is saved in device with device id: \(r.deviceID)"
    }
}

public struct B2BReceiptViewModel: ReceiptPresentable {
    public let receipt: Receipt
    
    public init(receipt: B2BReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptType() -> String {
        return "B2B receipt has been issued"
    }
    
    public func presentReceiptStatus() -> String {
        return "choose to print out or send through email"
    }
}
