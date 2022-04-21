//
//  ViewController.swift
//  2018051001郑煜test2
//
//  Created by 郑煜 on 2022/3/4.
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
        let data = NSMutableDictionary(contentsOfFile: NSHomeDirectory() + "/Documents/demo.plist")        //        将字典对象转化为字符串对象
        
        self.dataArray.removeAll()
        
        if data != nil{
            for (key,value) in data!{
                let s = Student.init(sKey: "\(key)" , sValue: "\(value)")
                dataArray.append(s)
            }
        }
        
        print("sandbox-path:"+NSHomeDirectory())
        
    }
    @IBAction func addStudent(_ sender: Any) {
        
        let s1 = t1.text!
        let s2 = t2.text!
        let s3 = t3.text!
        let i4:Int32? = Int32(t4.text!)
        let s = Student.init(sid: s1, sname: s2, sclass: s3, sage: i4!)
        dataArray.append(s)
        saveArray()
        tv1.reloadData()
        newStudent()
        
    }
    
    
    @IBAction func deleteAllStudent(_ sender: Any) {
        
        dataArray.removeAll()
        saveArray()
        tv1.reloadData()
    }
    
    func newStudent(){
        t1.text = ""
        t2.text = ""
        t3.text = ""
        t4.text = ""
    }
    func saveArray(){
        let dict:NSMutableDictionary = NSMutableDictionary()
        for s in dataArray{
            dict.setObject(s.getValue(), forKey: s.GetKey() as NSCopying)
        }
        //生成文件的存储路径
        //原文路径不对let plistPath = Bundle.main.path(forResource: "demoPlist", ofType: "plist")
        let plistPath =  NSHomeDirectory() + "/Documents/demo.plist"
        //        将可变字典对象写入到指定位置的属性列表文件
        dict.write(toFile: plistPath, atomically: true)
        print("sandbox-path:"+NSHomeDirectory())
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
        let studentInfo = "学号：\(st.s_id); 姓名：\(st.s_name); 班级：\(st.s_class); 年龄：\(st.s_age)"
        cell.textLabel?.text = studentInfo
        return cell
    }
   
}

