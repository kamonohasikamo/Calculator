//
//  ViewController.swift
//  sampleden
//
//  Created by suke on 2018/06/11.
//  Copyright © 2018年 suke. All rights reserved.
//

import UIKit

class ViewController: UIViewController { // x: KeisankiViewController, o: CalculatorViewController
    @IBOutlet weak var textField: UILabel! // xxxLabel -> operatorLabel
    @IBOutlet weak var preNum: UILabel! // 例: leftSideValueLabel
    @IBOutlet weak var calcNum: UILabel! // 例: resultValueLabel
    
//    enum SignType: String {
//        case plus, minus, multiplication, division
//    }
//    private var sign: SignType? = nil
    
    // xxx コメントはここがいいかも
    override func viewDidLoad() {//アプリが起動した時に実行される処理
        super.viewDidLoad()
        // xxxx コメントは処理の上に書くのが一般的
        textField.text = "" // 計算結果を初期化するときのためにもメソッドにしておくと良さそう
        preNum.text = "" // nil で初期化することが本当の初期化
        calcNum.text = ""
        //上記の処理はラベルを初期化（空列）にしておく
    }

    /* 消してもいいかも
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    // 数字のボタンをタップ(すると呼ばれる)
    // x numTapButton, o: tapNumberButton
    @IBAction func numTapped(_ sender: UIButton) { // コマンド+クリックで定義を見れる
        // もともと
        // calcNum.text! += sender.titleLabel!.text!
        // calcNum.text += sender.titleLabel!.text! 型があってなくてエラー
        
        if let titleLabel = sender.titleLabel, let titleText = titleLabel.text, let calNumText = calcNum.text {
            calcNum.text = calNumText + titleText
        }
    }

    @IBAction func calcsign(_ sender: UIButton) {
        textField.text = sender.titleLabel!.text //演算子を右上に表示
        preNum.text = calcNum.text //左上のラベルに今まで入力した数字を移動
        calcNum.text = "" //移動後はまたラベルを初期化 // nil がいいかも
        // sign = SignType(rawValue: textField.text!)
    }
    
    @IBAction func equal(_ sender: UIButton) {
        if Int(preNum.text!) != nil && Int(calcNum.text!) != nil {
            
            // ここをスマートに書きたい（短ければいいわけではない）
            if textField.text == "+"{
                calcNum.text = String(Int(preNum.text!)! + Int(calcNum.text!)!)
            }else if textField.text == "-" {
                calcNum.text = String(Int(preNum.text!)! - Int(calcNum.text!)!)
            }else if textField.text == "×" {
                calcNum.text = String(Int(preNum.text!)! * Int(calcNum.text!)!)
            }else if textField.text == "÷" {
                if Int(calcNum.text!) != 0 {
                calcNum.text = String(Int(preNum.text!)! / Int(calcNum.text!)!)
                } else if Int(calcNum.text!) == 0 {
                    calcNum.text = "error"
                }
            }
            
        } else {
            print("preNum.text or calcNum.text is nil")
        }
//        if let preNumText = preNum.text, let preNum = Int(preNumText),
//           let calcNumText = calcNum.text, let calcNum = Int(calcNumText),
//            let sign = sign {
//            switch sign {
//            case .plus: break
//            case .minus: /*xx*/ break
//            case .multiplication: /*xx*/ break
//            case .division: /*xx*/ break
//            }
//        }
    }
}

