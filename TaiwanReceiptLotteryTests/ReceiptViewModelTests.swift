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
    let taxID: String
    
    init(date: Date, price: Int, lotteryNumber: String, taxID: String) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        self.taxID = taxID
    }
}

struct ReceiptViewModel {
    let receipt: Receipt
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

class ReceiptViewModelTests: XCTestCase {

    func test_presentB2BReceipt() {
        let sut = ReceiptViewModel(Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931"))
        XCTAssertEqual(sut.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer")
    }
}
