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
        if let r = receipt as? B2BReceipt {
            receiptTypeLabel.text = "B2B receipt has been issued"
            lotteryNumberLabel.text = r.lotteryNumber
            receiptStatusLabel.text = "choose to print out or send through email"

        } else if let r = receipt as? CachedReceipt {
            receiptTypeLabel.text = "B2C receipt has been issued"
            lotteryNumberLabel.text = r.lotteryNumber
            receiptStatusLabel.text = "receipt is saved in device with device id: \(r.deviceID)"

        } else if let r = receipt as? NonprofitOrgReceipt {
            receiptTypeLabel.text = "B2C receipt has been issued"
            lotteryNumberLabel.text = r.lotteryNumber
            receiptStatusLabel.text = "receipt lottery opportunity has been donated to non profile organization, org id: \(r.organizationID)"

        } else {
            receiptTypeLabel.text = "B2C receipt has been issued"
            lotteryNumberLabel.text = receipt.lotteryNumber
            receiptStatusLabel.text = "receipt has been printed"
            
        }

    }
}

