//
//  ReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public struct ReceiptViewModel {
    let receipt: Receipt
    public init(_ receipt: Receipt) {
        self.receipt = receipt
    }
    
    public var title: String {
        switch receipt.specialField {
        case .taxID(let id):
            return "A B2B receipt has been issued, the company tax id is \(id)."
        
        case .mobileBarCode:
            return "A B2C receipt has been issued."
        
        case .npoCode:
            return "A B2C receipt has been issued."
        
        case .non:
            return "A B2C receipt has been issued."
        }
    }
    
    public var body: String {
        return "The lottery number is \(receipt.lotteryNumber)."
    }
    
    public var footer: String {
        switch receipt.specialField {
        case .taxID:
            return "You can choose to print out this receipt or send it to your customer through email."
        
        case .mobileBarCode(let code):
            return "The receipt is saved in cloud database with mobile barcode number: \(code)"
        
        case .npoCode(let code):
            return "The lottery opportunity has been donated to a non profit organization, the organization id is: \(code)"
        
        case .non:
            return "The receipt has been printed."
        }
    }
}
