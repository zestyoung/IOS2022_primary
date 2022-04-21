//
//  ViewControllerC.swift
//  2018051001郑煜作业6
//
//  Created by 郑煜 on 2022/3/18.
//

import UIKit

class ViewControllerC: UIViewController {

    @IBOutlet weak var tC: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tC.text = Data.Share.info
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bt3Touch(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        Data.Share.info = tC.text!
        Data.Share.from = "C"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
