//
//  ViewModel.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import Foundation
public protocol ReceiptPresentable {
    func presentReceiptType() -> String
    func presentReceiptLotteryNumber() -> String
    func presentReceiptStatus() -> String
}

public struct CommonB2CReceiptViewModel: ReceiptPresentable {
    private let receipt: CommonB2CReceipt
    
    public init(receipt: CommonB2CReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptType() -> String {
        return "B2C receipt has been issued"
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt has been printed"
    }
}

public struct NonprofitOrgReceiptViewModel: ReceiptPresentable {
    private let receipt: NonprofitOrgReceipt
    
    public init(receipt: NonprofitOrgReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptType() -> String {
        return "B2C receipt has been issued"
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt lottery opportunity has been donated to non profile organization, org id: \(receipt.organizationID)"
    }
}

public struct CachedReceiptViewModel: ReceiptPresentable {
    private let receipt: CachedReceipt
    
    public init(receipt: CachedReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptType() -> String {
        return "B2C receipt has been issued"
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt is saved in device with device id: \(receipt.deviceID)"
    }
}

public struct B2BReceiptViewModel: ReceiptPresentable {
    private let receipt: B2BReceipt
    
    public init(receipt: B2BReceipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
    
    public func presentReceiptType() -> String {
        return "B2B receipt has been issued"
    }
    
    public func presentReceiptStatus() -> String {
        return "choose to print out or send through email"
    }
}
