//
//  ViewController.swift
//  2018051001郑煜test5
//
//  Created by 郑煜 on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {
    
    let cellIdentifier1 = "mycell1"
    let cellIdentifier2 = "mycell2"
    var students:[Student] = [Student]()
    
    @IBOutlet weak var tv1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        set3students()
        tv1.delegate = self;
        tv1.dataSource = self;
        tv1.reloadData()
        
    }
    func set3students(){
        let i1 = UIImage(named: "Image1")!
        let i2 = UIImage(named: "Image2")!
        let i3 = UIImage(named: "Image3")!
        
        guard let s1 = Student(sid: "2018051001", sname: "郑煜", sclass: "信息工程大学计算机科学与技术194班", sage: 18, simage:i1 ) else{
            fatalError("student1 not init")
        }
        guard let s2 = Student(sid: "002", sname: "zhengyu", sclass: "计算机科学与技术194班", sage: 19, simage:i2) else{
            fatalError("student1 not init")
        }
        guard let s3 = Student(sid: "003", sname: "zy", sclass: "计科194班", sage: 20, simage:i3) else{
            fatalError("student1 not init")
        }
        students += [s1,s2,s3]
        
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let s = students[indexPath.row]
        
        if s.s_age <= 18{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier2, for: indexPath) as? mycell2
            
            // Configure the cell...
           
            cell?.l1.text = s.s_id
            cell?.l2.text = s.s_name
            cell?.l3.text = s.s_class
            cell?.l4.text = "\(s.s_age)"
            cell?.iv1.image = s.s_image
            if indexPath.row % 2 == 0{
                cell?.backgroundColor = UIColor.blue
            }else{
                cell?.backgroundColor = UIColor.green
            }
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier1, for: indexPath) as? mycell1
            
            // Configure the cell...
           
            cell?.l1.text = s.s_id
            cell?.l2.text = s.s_name
            cell?.l3.text = s.s_class
            cell?.l4.text = "\(s.s_age)"
            cell?.iv1.image = s.s_image
            if indexPath.row % 2 == 0{
                cell?.backgroundColor = UIColor.blue
            }else{
                cell?.backgroundColor = UIColor.green
            }
            return cell!
        }
    }
}
