//
//  ViewModelFactoryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/14.
//

import XCTest
import TaiwanReceiptLottery

class ViewModelFactoryTests: XCTestCase {
    func test_makeViewModelCollection() {
        let boxedReceipts: [ReceiptBox]
            = [.b2b(B2BReceipt(date: Date(), price: 100, lotteryNumber: "AA-12345678", taxID: "45002931")),
               .mobileBarCode(MobileBarCodeReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", mobileBarCode: "/AB201C9")),
               .donated(DonatedReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", npoID: "25885")),
               .printedB2C(PrintedB2CReceipt(date: Date(), price: 100, lotteryNumber: "AA-00000001"))
            ]
        
        let vms = ReceiptViewModelFactory.makeViewModes(from: boxedReceipts)
        
        let footer = vms.map { $0.footer() }
        
        XCTAssertEqual(footer, ["You can choose to print out this receipt or send it to your customer through email.",
                                "The receipt is saved in cloud database with mobile barcode number: /AB201C9",
                                "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885",
                                "The receipt has been printed."
        ])
    }
    
}
