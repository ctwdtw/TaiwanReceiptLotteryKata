//
//  ReceiptViewModelTests.swift
//  ReceiptViewModelTests
//
//  Created by Paul Lee on 2021/9/13.
//

import XCTest
import TaiwanReceiptLottery

class ReceiptViewModelTests: XCTestCase {
    func test_presentB2BReceipt() {
        let b2bReceipt = B2BReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931")
        let sut = ReceiptViewModel(b2bReceipt)

        XCTAssertEqual(sut.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title message")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(sut.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer message")
    }
    
    func test_presentB2CReceiptWithMobileBarCode() {
        let mobileBarCodeReceipt = MobileBarCodeReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9")
        let sut = ReceiptViewModel(mobileBarCodeReceipt)

        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(sut.footer, "The receipt is saved in cloud database with mobile barcode number: /AB201C9", "footer message")
    }
    
    func test_presentB2CReceiptWithNPOID() {
        let donatedReceipt = DonatedReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", npoID: "25885")
        let sut = ReceiptViewModel(donatedReceipt)

        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(sut.footer, "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885", "footer message")
    }
    
    func test_presentB2CReceiptPrinted() {
        let printedB2CReceipt = PrintedB2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001")
        let sut = ReceiptViewModel(printedB2CReceipt)

        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(sut.footer, "The receipt has been printed.", "footer message")
    }
}
