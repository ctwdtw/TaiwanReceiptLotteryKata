//
//  ReceiptViewController.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import UIKit

class ReceiptViewController: UIViewController {

    private var receipt: Receipt!
    
    convenience init(receipt: Receipt) {
        self.init()
        self.receipt = receipt
    }
    
    lazy var receiptTypeLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    lazy var lotteryNumberLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    lazy var receiptStatusLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = receiptTypeLabel
        _ = lotteryNumberLabel
        _ = receiptStatusLabel
        displayReceipt()
    }
    
    func displayReceipt() {
        receiptTypeLabel.text = receipt.presentReceiptType()
        lotteryNumberLabel.text = receipt.lotteryNumber
        receiptStatusLabel.text = receipt.presentReceiptStatus()
    }
}

