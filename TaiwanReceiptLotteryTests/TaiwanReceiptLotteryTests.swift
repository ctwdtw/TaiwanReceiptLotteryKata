//
//  TaiwanReceiptLotteryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/13.
//

import XCTest
import TaiwanReceiptLottery

class ReceiptViewModel {
    private var receipt: Receipt
    
    init(_ receipt: Receipt) {
        self.receipt = receipt
    }
    
    var title: String {
        return "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    var body: String {
        return "The lottery number is \(receipt.lotteryNumber)."
    }
    
    var footer: String {
        return "You can choose to print out this receipt or send it to your customer through email."
    }
    
}

class Receipt {
    private var date: Date
    private var price: Int
    private(set) var lotteryNumber: String
    private(set) var taxID: String
    
    init(date: Date, price: Int, lotteryNumber: String, taxID: String) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        self.taxID = taxID
    }
}

class B2CReceipt {
    private var date: Date
    private var price: Int
    private(set) var lotteryNumber: String
    private(set) var mobileBarCode: String
    
    init(date: Date, price: Int, lotteryNumber: String, mobileBarCode: String) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        self.mobileBarCode = mobileBarCode
    }
}

class B2CReceiptViewModel {
    private var receipt: B2CReceipt
    
    init(_ receipt: B2CReceipt) {
        self.receipt = receipt
    }
    
    var title: String {
        return "A B2C receipt has been issued."
    }
    
    var body: String {
        return "The lottery number is \(receipt.lotteryNumber)."
    }
    
    var footer: String {
        return "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
    
}

class TaiwanReceiptLotteryTests: XCTestCase {
    func test_presentB2BReceipt() {
        let b2bReceipt = Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931")
        let vm = ReceiptViewModel(b2bReceipt)

        XCTAssertEqual(vm.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer message")
    }
    
    func test_presentB2CReceiptWithMobileBarCode() {
        let b2bReceipt = B2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9")
        let vm = B2CReceiptViewModel(b2bReceipt)

        XCTAssertEqual(vm.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "The receipt is saved in cloud database with mobile barcode number: /AB201C9", "footer message")
    }
}
