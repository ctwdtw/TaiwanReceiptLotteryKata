//
//  TaiwanReceiptLotteryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/13.
//

import XCTest
import TaiwanReceiptLottery

protocol Receipt {
    var data: ReceiptData { get }
}

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

public class B2BReceipt: Receipt {
    let data: ReceiptData
    private(set) var taxID: String
    
    public init(date: Date, price: Int, lotteryNumber: String, taxID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.taxID = taxID
    }
}

public class MobileBarCodeReceipt: Receipt {
    private(set) var mobileBarCode: String
    let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, mobileBarCode: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.mobileBarCode = mobileBarCode
    }
}

public class DonatedReceipt: Receipt {
    private(set) var npoID: String
    let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String, npoID: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
        self.npoID = npoID
    }
}

public class PrintedB2CReceipt: Receipt {
    let data: ReceiptData
    
    public init(date: Date, price: Int, lotteryNumber: String) {
        self.data = ReceiptData(date: date, price: price, lotteryNumber: lotteryNumber)
    }
}

class ReceiptViewModel<ReceiptModel: Receipt> {
    private var receipt: ReceiptModel
    
    var title: String {
        return "A B2C receipt has been issued."
    }
    
    var body: String {
        return "The lottery number is \(receipt.data.lotteryNumber)."
    }
    
    init(_ receipt: ReceiptModel) {
        self.receipt = receipt
    }
}

extension ReceiptViewModel where ReceiptModel == B2BReceipt {
    var title: String {
        return "A B2B receipt has been issued, the company tax id is \(receipt.taxID)."
    }
    
    var footer: String {
        return "You can choose to print out this receipt or send it to your customer through email."
    }
}

extension ReceiptViewModel where ReceiptModel == MobileBarCodeReceipt {
    var footer: String {
        return "The receipt is saved in cloud database with mobile barcode number: \(receipt.mobileBarCode)"
    }
}

extension ReceiptViewModel where ReceiptModel == DonatedReceipt {
    var footer: String {
        return "The lottery opportunity has been donated to a non profit organization, the organization id is: \(receipt.npoID)"
    }
}

extension ReceiptViewModel where ReceiptModel == PrintedB2CReceipt {
    var footer: String {
        return "The receipt has been printed."
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
