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
    public var receipt: Receipt {
        return _receipt
    }
    
    private let _receipt: NonprofitOrgReceipt
    
    public init(receipt: NonprofitOrgReceipt) {
        self._receipt = receipt
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt lottery opportunity has been donated to non profile organization, org id: \(_receipt.organizationID)"
    }
}

public struct CachedReceiptViewModel: ReceiptPresentable {
    public var receipt: Receipt {
        return _receipt
    }
    
    private let _receipt: CachedReceipt
    
    public init(receipt: CachedReceipt) {
        self._receipt = receipt
    }
    
    public func presentReceiptStatus() -> String {
        return "receipt is saved in device with device id: \(_receipt.deviceID)"
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
