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

public struct ReceiptViewModel<R: Receipt>: ReceiptPresentable {
    public var receipt: Receipt {
        return _receipt
    }
    
    private let _receipt: R
    
    public init(receipt: R) {
        self._receipt = receipt
    }
}

extension ReceiptViewModel where R: Receipt {
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

extension ReceiptViewModel where R == NonprofitOrgReceipt {
    public func presentReceiptStatus() -> String {
        return "receipt lottery opportunity has been donated to non profile organization, org id: \(_receipt.organizationID)"
    }
}

extension ReceiptViewModel where R == CachedReceipt {
    public func presentReceiptStatus() -> String {
        return "receipt is saved in device with device id: \(_receipt.deviceID)"
    }
}

extension ReceiptViewModel where R == B2BReceipt {
    public func presentReceiptType() -> String {
        return "B2B receipt has been issued, taxID: \(_receipt.taxID)"
    }
    
    public func presentReceiptStatus() -> String {
        return "choose to print out or send through email"
    }
}
