//
//  ViewModelsFactoryTests.swift
//  TaiwanReceiptLotteryTests
//
//  Created by Paul Lee on 2021/9/14.
//

import XCTest
import TaiwanReceiptLottery

class ViewModelsFactoryTests: XCTestCase {

    func test_makeViewModelCollection() {
        let receipts = [
            Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", specialField: .taxID("45002931")),
            Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", specialField: .mobileBarCode("/AB201C9")),
            Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", specialField: .npoCode("25885")),
            Receipt(date: Date(), price: 100, lotteryNumber: "AA-00000001", specialField: .non)
        ]
        
        let vms = ViewModelsFactory.makeViewModels(receipts)
        
        let footers = vms.map { $0.footer }
        XCTAssertEqual(
            footers,
            ["You can choose to print out this receipt or send it to your customer through email.",
             "The receipt is saved in cloud database with mobile barcode number: /AB201C9",
             "The lottery opportunity has been donated to a non profit organization, the organization id is: 25885",
             "The receipt has been printed."
        ])
    }

}
