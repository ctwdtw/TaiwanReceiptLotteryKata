//
//  ReceiptViewController.swift
//  OOExercise
//
//  Created by Paul Lee on 2021/1/16.
//

import UIKit

public class ReceiptViewController: UIViewController {

    private var receiptViewModel: ReceiptViewModel<AnyReceipt>!

    public convenience init(viewModel: ReceiptViewModel<AnyReceipt>) {
        self.init()
        self.receiptViewModel = viewModel
    }
    
    @objc public lazy var receiptTypeLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    @objc public lazy var lotteryNumberLabel: UILabel = {
        let label = UILabel()
        //
        // .. layout code goes here
        //
        return label
    }()
    
    @objc public lazy var receiptStatusLabel: UILabel = {
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
        receiptTypeLabel.text = receiptViewModel.presentReceiptType()
        lotteryNumberLabel.text = receiptViewModel.presentReceiptLotteryNumber()
        receiptStatusLabel.text = receiptViewModel.presentReceiptStatus()
    }
}

