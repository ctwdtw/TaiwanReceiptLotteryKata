//
//  ReceiptViewModelTests.swift
//  ReceiptViewModelTests
//
//  Created by Paul Lee on 2021/9/14.
//

import XCTest
import TaiwanReceiptLottery

struct Receipt {
    let date: Date
    let price: Int
    let lotteryNumber: String
    let taxID: String?
    let mobileBarCode: String?
    let npoCode: String?
    
    init(date: Date, price: Int, lotteryNumber: String, taxID: String? = nil, mobileBarCode: String? = nil, npoCode: String? = nil) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        self.taxID = taxID
        self.mobileBarCode = mobileBarCode
        self.npoCode = npoCode
    }
}

struct ReceiptViewModel {
    let receipt: Receipt
    init(_ receipt: Receipt) {
        self.receipt = receipt
    }
    
    var title: String {
        if let taxID = receipt.taxID {
            return "A B2B receipt has been issued, the company tax id is \(taxID)."
            
        } else {
            return "A B2C receipt has been issued."
        }
    }
    
    var body: String {
        return "The lottery number is \(receipt.lotteryNumber)."
    }
    
    var footer: String {
        if let _ = receipt.taxID {
            return "You can choose to print out this receipt or send it to your customer through email."
        } else if let code = receipt.mobileBarCode {
            return "The receipt is saved in cloud database with mobile barcode number: \(code)"
            
        } else if let code = receipt.npoCode {
            return "The lottery opportunity has been donated to a non profit organization, the organization id is: \(code)"
            
        } else {
            return ""
            
        }
    }
}

class ReceiptViewModelTests: XCTestCase {

    func test_presentB2BReceipt() {
        let sut = ReceiptViewModel(Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931"))
        XCTAssertEqual(sut.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer")
    }
    
    func test_presentMobileBarCodeReceipt() {
        let sut = ReceiptViewModel(Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9"))
        
        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "The receipt is saved in cloud database with mobile barcode number: /AB201C9", "footer")
    }
    
    func test_presentDonatedReceipt() {
        let sut = ReceiptViewModel(Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", npoCode: "25885"))
        
        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885", "footer")
    }
    
}
