//
//  AnyReceiptViewModel.swift
//  TaiwanReceiptLottery
//
//  Created by Paul Lee on 2021/9/14.
//

import Foundation
public struct AnyReceiptViewModel {
    public let title: () -> String
    public let body: () -> String
    public let footer: () -> String
}
