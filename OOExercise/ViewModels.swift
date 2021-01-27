//
//  ViewModel.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import Foundation
public protocol ReceiptPresentable {
    associatedtype ReceiptType
    var receipt: ReceiptType { get }
    func presentReceiptType() -> String
    func presentReceiptLotteryNumber() -> String
    func presentReceiptStatus() -> String
}

public struct AnyReceipt: Receipt {
    public var commonFields: ReceiptCommonFields {
        return _receipt.commonFields
    }
    
    private let _receipt: Receipt
   
    public init(receipt: Receipt) {
        self._receipt = receipt
    }
}

public struct ReceiptViewModel<R: Receipt> {
    public let receipt: R
    
    public init(receipt: R) {
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

extension ReceiptViewModel: ReceiptPresentable where R == CommonB2CReceipt {}


//
//extension ReceiptPresentable where Self == ReceiptViewModel<NonprofitOrgReceipt> {
//    public func presentReceiptStatus() -> String {
//        return "receipt lottery opportunity has been donated to non profile organization, org id: \(receipt.organizationID)"
//    }
//}
//
//extension ReceiptPresentable where Self == ReceiptViewModel<CachedReceipt> {
//    public func presentReceiptStatus() -> String {
//        return "receipt is saved in device with device id: \(receipt.deviceID)"
//    }
//}
//
//extension ReceiptPresentable where Self == ReceiptViewModel<B2BReceipt> {
//    public func presentReceiptType() -> String {
//        return "B2B receipt has been issued, taxID: \(receipt.taxID)"
//    }
//
//    public func presentReceiptStatus() -> String {
//        return "choose to print out or send through email"
//    }
//}
