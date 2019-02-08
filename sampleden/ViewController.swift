//
//  ViewController.swift
//  sampleden
//
//  Created by suke on 2018/06/11.
//  Copyright © 2018年 suke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var preNum: UILabel!
    @IBOutlet weak var calcNum: UILabel!
    override func viewDidLoad() {//アプリが起動した時に実行される処理
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.text = ""
        preNum.text = ""
        calcNum.text = ""
        //上記の処理はラベルを初期化（空列）にしておく
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func numTapped(_ sender: UIButton) {
        calcNum.text! += sender.titleLabel!.text!
    }
    
    
    

    @IBAction func calcsign(_ sender: UIButton) {
        textField.text! = sender.titleLabel!.text! //演算子を右上に表示
        preNum.text = calcNum.text //左上のラベルに今まで入力した数字を移動
        calcNum.text = "" //移動後はまたラベルを初期化
    }
    
    @IBAction func equal(_ sender: UIButton) {
        if Int(preNum.text!) != nil && Int(calcNum.text!) != nil {
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
        }
    }
}

