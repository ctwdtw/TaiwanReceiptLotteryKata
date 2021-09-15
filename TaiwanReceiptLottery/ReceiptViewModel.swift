//
//  ReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public protocol ReceiptViewModel {
    var title: String { get }
    var body: String { get }
    var footer: String { get }
}
