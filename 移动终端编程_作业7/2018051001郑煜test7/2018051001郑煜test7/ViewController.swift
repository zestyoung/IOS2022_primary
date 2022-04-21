//
//  ViewController.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tv1: UITableView!
    @IBOutlet weak var l1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv1.delegate = self
        tv1.dataSource = self
        DataShare.shared.students = CoreDataManager.shared.getAllStudent()
        tv1.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tv1.reloadData()
        if(DataShare.shared.from == "UIsearch"){
            let s = DataShare.shared.info
            if(s == "") {
                l1.text = "查询所有学生"
            }
            else {
                l1.text = "查询条件：" + s
            }
        }
        else {
            l1.text = "查询所有学生"
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataShare.shared.students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //查找s.class里面是否有音乐班年龄是否小于十八岁，如果是执行cellA否则cellB
        
        let s = DataShare.shared.students[indexPath.row]
        
        var dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日"
        var sBorn = " "
        
        if s.s_born != nil{
            sBorn = dformatter.string(from: s.s_born!)
        }else{
            sBorn = " "
        }
        
        let strClass:String = s.s_class!
        if (strClass.hasPrefix("music") || (s.s_age <= 18)) {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "cellA", for: indexPath) as! TableViewCellA
            cell.l1.text = s.s_id
            cell.l2.text = s.s_name
            cell.l3.text = s.s_class
            cell.l4.text = "\(s.s_age)"
            cell.l5.text = "\(s.s_h)"
            cell.l6.text = "\(s.s_w)"
            cell.date1.text = sBorn
            
            if s.s_image == nil{
                cell.iv1.image = nil
            }
            else{
                cell.iv1.image = UIImage(data: s.s_image as! Data)
                
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellB", for: indexPath) as! TableViewCellB
            cell.l1.text = s.s_id
            cell.l2.text = s.s_name
            cell.l3.text = s.s_class
            cell.l4.text = "\(s.s_age)"
            cell.l5.text = "\(s.s_h)"
            cell.l6.text = "\(s.s_w)"
            cell.date1.text = sBorn
            
            if s.s_image == nil{
                cell.iv1.image = nil
            }
            else{
                cell.iv1.image = UIImage(data: s.s_image as! Data)
                
            }
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataShare.shared.student_select = indexPath.row
        DataShare.shared.from = "UIList"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete{
           
           let id = DataShare.shared.students[indexPath.row].s_id!
           CoreDataManager.shared.deleteWith(sid: id)
           DataShare.shared.students = CoreDataManager.shared.getAllStudent()
           tv1.reloadData()
       }
       else if editingStyle == .insert{
            

        }
        else if editingStyle == .none{

        }
   }
}
