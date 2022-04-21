//
//  ViewController.swift
//  2018051001郑煜test1
//
//  Created by 郑煜 on 2022/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var sum: UITextField!
    
    @IBOutlet weak var studentID: UITextField!
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var student: UITextField!
    
    var colourid = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func t1t2change(_ sender: Any) {
        if(t1.text != "" && t2.text != "" ){
            let i1 = Int(t1.text!)!
            let i2 = Int(t2.text!)!
            sum.text = String(i1+i2)
        }
    }
    
    @IBAction func studentsum(_ sender: Any) {
        student.text = studentID.text! + studentName.text!
    }
    
    @IBAction func btchangecoulour(_ sender: Any) {
        if colourid == 0{
            view.backgroundColor = UIColor.purple
            colourid = 1
        }
        else if colourid == 1{
            view.backgroundColor = UIColor.black
            colourid = 2
        }
        else if colourid == 2{
            view.backgroundColor = UIColor.orange
            colourid = 3
        }
        else if colourid == 3{
            view.backgroundColor = UIColor.white
            colourid = 0
        }
    }
}

