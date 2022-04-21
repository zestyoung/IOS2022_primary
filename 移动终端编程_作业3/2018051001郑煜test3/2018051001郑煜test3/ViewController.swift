//
//  ViewController.swift
//  2018051001郑煜test3
//
//  Created by 郑煜 on 2022/3/8.
//

import UIKit

class ViewController: UIViewController {
    let dataCellID = "dataCellID"
    var dataArray: [Student] = [Student]()

    
    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    
    @IBOutlet weak var t3: UITextField!
    
    @IBOutlet weak var t4: UITextField!
    
    @IBOutlet weak var tv1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv1.delegate = self
        tv1.dataSource = self
        tv1.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: dataCellID)
        getAllStudent()
        tv1.reloadData()
    }
    
    func getAllStudent(){
        dataArray = CoreDataManager.shared.getAllStudent()
    }

    @IBAction func b1Touch(_ sender: Any) {
        let id = t1.text!
        let name = t2.text!
        let _class = t3.text!
        let age:Int16? = Int16(t4.text!)
        CoreDataManager.shared.addStudent(sid: id, sname: name, sclass: _class, sage: age!)
        dataArray = CoreDataManager.shared.getAllStudent()
        tv1.reloadData()
        t1.text = ""
        t2.text = ""
        t3.text = ""
        t4.text = ""
    }
    
    @IBAction func b2Touch(_ sender: Any) {
        CoreDataManager.shared.deleteAllPerson()
        dataArray = CoreDataManager.shared.getAllStudent()
        tv1.reloadData()
    }
    
    @IBAction func b3Touch(_ sender: Any) {
        let id1 = t1.text!
        dataArray = CoreDataManager.shared.getStudentWith(id: id1)
        tv1.reloadData()
    }
    
    @IBAction func b4Touch(_ sender: Any) {
        let id2 = t1.text!
        CoreDataManager.shared.deleteWith(sid: id2)
        dataArray = CoreDataManager.shared.getAllStudent()
        tv1.reloadData()
    }
}

// MARK: - UITableViewDelegate，UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataCellID, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        let st = dataArray[indexPath.row]
        let studentInfo = "学号：\(st.s_id!); 姓名：\(st.s_name!); 班级：\(st.s_class!); 年龄：\(st.s_age)"
        cell.textLabel?.text = studentInfo
        return cell
    }

}
