//
//  OOExerciseTests.swift
//  OOExerciseTests
//
//  Created by Paul Lee on 2021/1/16.
//

import XCTest
import OOExercise

class OOExerciseTests: XCTestCase {

    func testRenderB2BReceipt() {
        //
        let b2bReceipt = B2BReceipt(
            lotteryNumber: fixedLotteryNumber(),
            date: anyDate(),
            price: 100,
            taxID: anyTaxID(),
            companyName: anyCompanyName()
        )
        
        let viewModel = ReceiptViewModel(receipt: AnyReceipt(receipt: b2bReceipt))
        
        let sut = ReceiptViewController(viewModel: viewModel)
        
        //
        sut.loadViewIfNeeded()
        
        //
        assertThat(
            sut,
            renderReceiptTypeText: "B2B receipt has been issued, taxID: \(anyTaxID())",
            lotteryNumberText: fixedLotteryNumber(),
            receiptStatusText: "choose to print out or send through email"
        )
    }
    
    func testRenderCachedReceipt() {
        //
        let cachedReceipt = CachedReceipt(
            lotteryNumber: fixedLotteryNumber(),
            date: anyDate(),
            price: 100,
            deviceID: anyDeviceID()
        )
        
        let viewModel = ReceiptViewModel(receipt: AnyReceipt(receipt: cachedReceipt))
        
        let sut = ReceiptViewController(viewModel: viewModel)
        
        //
        sut.loadViewIfNeeded()
        
        //
        assertThat(
            sut,
            renderReceiptTypeText: "B2C receipt has been issued",
            lotteryNumberText: fixedLotteryNumber(),
            receiptStatusText: "receipt is saved in device with device id: \(anyDeviceID())"
        )
    }
    
    func testRenderDonatedReceipt() {
        //
        let donatedReceipt = NonprofitOrgReceipt(
            lotteryNumber: fixedLotteryNumber(),
            date: anyDate(),
            price: 100,
            organizationID: anyNonprofitOrgID()
        )
        
        let viewModel = ReceiptViewModel(receipt: AnyReceipt(receipt: donatedReceipt))
        
        let sut = ReceiptViewController(viewModel: viewModel)
        
        //
        sut.loadViewIfNeeded()
        
        //
        assertThat(
            sut,
            renderReceiptTypeText: "B2C receipt has been issued",
            lotteryNumberText: fixedLotteryNumber(),
            receiptStatusText: "receipt lottery opportunity has been donated to non profile organization, org id: \(anyNonprofitOrgID())"
        )
    }
    
    func testRenderCommonB2CReceipt() {
        //
        let commonB2CReceipt = CommonB2CReceipt(
            lotteryNumber: fixedLotteryNumber(),
            date: anyDate(),
            price: 100
        )
        
        let viewModel = ReceiptViewModel(receipt: AnyReceipt(receipt: commonB2CReceipt))
        
        let sut = ReceiptViewController(viewModel: viewModel)
        
        //
        sut.loadViewIfNeeded()
        
        //
        assertThat(
            sut,
            renderReceiptTypeText: "B2C receipt has been issued",
            lotteryNumberText: fixedLotteryNumber(),
            receiptStatusText: "receipt has been printed"
        )
    }
    
    //MARK: - helpers
    private func fixedLotteryNumber() -> String {
        return "AA12345678"
    }
    
    private func anyDate() -> Date {
        return Date()
    }
    
    private func anyTaxID() -> String {
        return "anyTaxID"
    }
    
    private func anyCompanyName() -> String {
        return "anyCompanyName"
    }
    
    private func anyDeviceID() -> String {
        return "anyDeviceID"
    }
    
    private func anyNonprofitOrgID() -> String {
        return "anyNonprofitOrgID"
    }
    
    private func assertThat(
        _ sut: ReceiptViewController,
        renderReceiptTypeText receiptTypeText: String,
        lotteryNumberText: String,
        receiptStatusText: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        
        guard let actReceiptTypeText = sut.receiptTypeLabel.text else {
            XCTFail("nil text on \(#selector(getter: sut.receiptTypeLabel))", file: file, line: line)
            return
        }
        
        XCTAssertEqual(actReceiptTypeText, receiptTypeText, file: file, line: line)
        
        guard let actLotteryNumberText = sut.lotteryNumberLabel.text else {
            XCTFail("nil text on \(#selector(getter: sut.lotteryNumberLabel))", file: file, line: line)
            
            return
        }
        
        
        XCTAssertEqual(actLotteryNumberText, lotteryNumberText, file: file, line: line)
        
        guard let actReceiptStatusText = sut.receiptStatusLabel.text else {
            XCTFail("nil text on \(#selector(getter: sut.receiptStatusLabel))", file: file, line: line)
            return
        }
        
        XCTAssertEqual(
            actReceiptStatusText,
            receiptStatusText,
            "text mis-match",
            file: file,
            line: line
        )
        
    }

}
