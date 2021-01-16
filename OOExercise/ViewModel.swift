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

public struct ReceiptViewModel: ReceiptPresentable {
    private let receipt: Receipt
    
    public init(receipt: Receipt) {
        self.receipt = receipt
    }
    
    public func presentReceiptLotteryNumber() -> String {
        return receipt.commonFields.lotteryNumber
    }
    
    public func presentReceiptType() -> String {
        if let _ = receipt as? B2BReceipt {
            return "B2B receipt has been issued"
        } else {
            return "B2C receipt has been issued"
        }
    }
    
    public func presentReceiptStatus() -> String {
        if let _ = receipt as? B2BReceipt {
            return "choose to print out or send through email"
        
        } else if let _ = receipt as? CommonB2CReceipt {
            return "receipt has been printed"
            
        } else if let r = receipt as? CachedReceipt {
            return "receipt is saved in device with device id: \(r.deviceID)"
            
        } else if let r = receipt as? NonprofitOrgReceipt {
            return "receipt lottery opportunity has been donated to non profile organization, org id: \(r.organizationID)"
            
        } else {
            return ""
            
        }
    }
}
