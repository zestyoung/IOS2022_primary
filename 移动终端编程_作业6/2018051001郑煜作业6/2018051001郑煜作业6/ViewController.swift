//
//  ViewController.swift
//  2018051001郑煜作业6
//
//  Created by 郑煜 on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tA: UITextField!
    
    @IBOutlet weak var tB: UITextField!
    
    @IBOutlet weak var tC: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bt1Touch(_ sender: Any) {
        Data.Share.info = tA.text!
    }
    
    @IBAction func bt2Touch(_ sender: Any) {
        Data.Share.info = tB.text!
    }
    
    @IBAction func bt3Touch(_ sender: Any) {
        Data.Share.info = tC.text!
    }
    override func viewWillAppear(_ animated: Bool) {
        if (Data.Share.from == "A"){
            tA.text = Data.Share.info
        }
        else if (Data.Share.from == "B"){
            tB.text = Data.Share.info
        }
        else{
            tC.text = Data.Share.info
        }
    }
}

