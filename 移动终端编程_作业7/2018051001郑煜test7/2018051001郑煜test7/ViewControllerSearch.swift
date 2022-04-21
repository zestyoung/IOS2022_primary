//
//  ViewControllerSearch.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/25.
//

import UIKit

class ViewControllerSearch: UIViewController{

    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    
    @IBOutlet weak var t3: UITextField!
    
    @IBOutlet weak var t4: UITextField!
   
    @IBOutlet weak var t5: UITextField!
   
    @IBOutlet weak var t6: UITextField!
    
    @IBOutlet weak var t7: UITextField!
    
    @IBOutlet weak var t8: UITextField!
   
    @IBOutlet weak var t9: UITextField!
    
    @IBOutlet weak var t10: UITextField!
    
   
    
    @IBAction func search(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func clear(_ sender: Any) {
        for c in self.view.subviews{
            if c is UITextField{
                let t = c as! UITextField
                t.text = ""
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        var search = ""
        
        if t1.text != ""{
            search =  "(s_id like '\(t1.text!)')"
            
        }
        
        if t2.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_name like '\(t2.text!)*')"
        }
        
        if t3.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_name like '*\(t3.text!)')"
        }
        
        if t4.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_name like '\(t4.text!)')"
        }
        
        if t5.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_age > \(t5.text!))"
        }
        
        if t6.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_age = \(t6.text!))"
        }
        
        if t7.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_age < \(t7.text!))"
        }
        
        if t8.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_h > \(t8.text!))"
        }
        
        if t9.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_h = \(t9.text!))"
        }
        
        if t10.text != ""{
            if search != ""{
                search += " and "
            }
            search += "(s_h < \(t10.text!))"
        }
        
        
        
        
        DataShare.shared.info = search
        DataShare.shared.from = "UIsearch"
        if search == "" {
            DataShare.shared.students = CoreDataManager.shared.getAllStudent()
        }
        else{
            
            DataShare.shared.students =  CoreDataManager.shared.getStudentWith(condition: search)
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
