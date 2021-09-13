//
//  TaiwanReceiptLotteryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/13.
//

import XCTest
import TaiwanReceiptLottery

class TaiwanReceiptLotteryTests: XCTestCase {
    func test_presentB2BReceipt() {
        let b2bReceipt = B2BReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931")
        let vm = ReceiptViewModel(b2bReceipt)

        XCTAssertEqual(vm.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer message")
    }
    
    func test_presentB2CReceiptWithMobileBarCode() {
        let mobileBarCodeReceipt = MobileBarCodeReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9")
        let vm = ReceiptViewModel(mobileBarCodeReceipt)

        XCTAssertEqual(vm.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "The receipt is saved in cloud database with mobile barcode number: /AB201C9", "footer message")
    }
    
    func test_presentB2CReceiptWithNPOID() {
        let donatedReceipt = DonatedReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", npoID: "25885")
        let vm = ReceiptViewModel(donatedReceipt)

        XCTAssertEqual(vm.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885")
    }
    
    func test_presentB2CReceiptPrinted() {
        let printedB2CReceipt = PrintedB2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001")
        let vm = ReceiptViewModel(printedB2CReceipt)

        XCTAssertEqual(vm.title, "A B2C receipt has been issued.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "The receipt has been printed.")
    }
}
