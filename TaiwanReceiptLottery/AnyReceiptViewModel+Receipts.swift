//
//  AnyReceiptViewModel+Receipts.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
extension AnyReceiptViewModel {
    init(vm: ReceiptViewModel<B2BReceipt>) {
        title =  { vm.title }
        body = { vm.body }
        footer =  { vm.footer }
    }
}

extension AnyReceiptViewModel {
    init(vm: ReceiptViewModel<MobileBarCodeReceipt>) {
        title =  { vm.title }
        body = { vm.body }
        footer =  { vm.footer }
    }
}

extension AnyReceiptViewModel {
    init(vm: ReceiptViewModel<DonatedReceipt>) {
        title =  { vm.title }
        body = { vm.body }
        footer =  { vm.footer }
    }
}

extension AnyReceiptViewModel {
    init(vm: ReceiptViewModel<PrintedB2CReceipt>) {
        title =  { vm.title }
        body = { vm.body }
        footer =  { vm.footer }
    }
}
