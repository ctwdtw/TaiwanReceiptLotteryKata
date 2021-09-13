//
//  TaiwanReceiptLotteryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/13.
//

import XCTest
import TaiwanReceiptLottery

struct ReceiptData {
    private var date: Date
    private var price: Int
    private(set) var lotteryNumber: String
    
    init(date: Date, price: Int, lotteryNumber: String) {
        self.date = date
        self.price = price
        self.lotteryNumber = lotteryNumber
        
    }
}

public class B2BReceipt {
    let data: ReceiptData
    private(set) var taxID: String
    
    public init(date: Date, price: Int, lotteryNumber: String, taxID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.taxID = taxID
    }
}

public class B2CReceipt {
    private(set) var mobileBarCode: String
    let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, mobileBarCode: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.mobileBarCode = mobileBarCode
    }
}

public class DonatedReceipt {
    private(set) var npoID: String
    let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, npoID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.npoID = npoID
    }
}

class ReceiptViewModel<ReceiptModel> {
    private var receipt: ReceiptModel
    
    init(_ receipt: ReceiptModel) {
        self.receipt = receipt
    }
}

extension ReceiptViewModel where ReceiptModel == B2CReceipt {
    var title: String {
        return "A B2C receipt has been issued."
    }
    
    var body: String {
        return "The lottery number is \(receipt.data.lotteryNumber)."
    }
    
    var footer: String {
        return "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
}

extension ReceiptViewModel where ReceiptModel == B2BReceipt {
    var title: String {
        return "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    var body: String {
        return "The lottery number is \(receipt.data.lotteryNumber)."
    }
    
    var footer: String {
        return "You can choose to print out this receipt or send it to your customer through email."
    }
}

extension ReceiptViewModel where ReceiptModel == DonatedReceipt {
    var title: String {
        return "A B2C receipt has been issued."
    }
    
    var body: String {
        return "The lottery number is \(receipt.data.lotteryNumber)."
    }
    
    var footer: String {
        return "The lottery opportunity has been donated to a non profit organization, the organization id is: \(receipt.npoID)"
    }
}

class TaiwanReceiptLotteryTests: XCTestCase {
    func test_presentB2BReceipt() {
        let b2bReceipt = B2BReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", taxID: "45002931")
        let vm = ReceiptViewModel(b2bReceipt)

        XCTAssertEqual(vm.title, "A B2B receipt has been issued, the company tax id is 45002931.", "title message")
        XCTAssertEqual(vm.body, "The lottery number is AA-00000001.", "body message")
        XCTAssertEqual(vm.footer, "You can choose to print out this receipt or send it to your customer through email.", "footer message")
    }
    
    func test_presentB2CReceiptWithMobileBarCode() {
        let b2cReceipt = B2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9")
        let vm = ReceiptViewModel(b2cReceipt)

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
    
}
