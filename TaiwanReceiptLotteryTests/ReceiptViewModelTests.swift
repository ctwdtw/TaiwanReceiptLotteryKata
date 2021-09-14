//
//  ReceiptViewModelTests.swift
//  ReceiptViewModelTests
//
//  Created by Paul Lee on 2021/9/14.
//

import XCTest
import TaiwanReceiptLottery

class ReceiptViewModelTests: XCTestCase {

    func test_presentB2BReceipt() {
        let sut = B2BReceiptViewModel(B2BReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931"))
        XCTAssertEqual(sut.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer")
    }
    
    func test_presentMobileBarCodeReceipt() {
        let sut = MobileBarCodeReceiptViewModel(MobileBarCodeReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9"))
        
        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "The receipt is saved in cloud database with mobile barcode number: /AB201C9", "footer")
    }
    
    func test_presentDonatedReceipt() {
        let sut = NPOReceiptViewModel(NPOCodeReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", npoCode: "25885"))
        
        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885", "footer")
    }
    
    func test_presentPrintedB2CReceipt() {
        let sut = PrintedB2CReceiptViewModel(PrintedB2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001"))
        
        XCTAssertEqual(sut.title, "A B2C receipt has been issued.", "title")
        XCTAssertEqual(sut.body, "The lottery number is AA-00000001.", "body")
        XCTAssertEqual(sut.footer, "The receipt has been printed.", "footer")
    }
    
}
