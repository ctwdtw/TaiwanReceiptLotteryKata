//
//  ReceiptViewController.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import UIKit

public class ReceiptViewController: UIViewController {

    private var receipt: Receipt!
    
    public convenience init(receipt: Receipt) {
        self.init()
        self.receipt = receipt
    }
    
    public lazy var receiptTypeLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    public lazy var lotteryNumberLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    public lazy var receiptStatusLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        _ = receiptTypeLabel
        _ = lotteryNumberLabel
        _ = receiptStatusLabel
        displayReceipt()
    }
    
    private func displayReceipt() {
        receiptTypeLabel.text = receipt.presentReceiptType()
        lotteryNumberLabel.text = receipt.lotteryNumber
        receiptStatusLabel.text = receipt.presentReceiptStatus()
    }
}

