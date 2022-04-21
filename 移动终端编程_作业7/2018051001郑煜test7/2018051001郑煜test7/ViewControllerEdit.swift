//
//  ViewControllerEdit.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/25.
//

import UIKit

class ViewControllerEdit: UIViewController {
    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    
    @IBOutlet weak var t3: UITextField!
    
    @IBOutlet weak var t4: UITextField!
    
    @IBOutlet weak var t5: UITextField!
    
    @IBOutlet weak var t6: UITextField!
    
    @IBOutlet weak var iv1: UIImageView!
    
    
    @IBOutlet weak var date1: UIDatePicker!
    
    
    @IBOutlet weak var BtClear: UIButton!
    
    @IBOutlet weak var BtAdd: UIButton!
    
    @IBOutlet weak var BtModify: UIButton!
    
    
    @IBOutlet weak var BtDelete: UIButton!
    
    @IBOutlet weak var BtLast: UIButton!
    
    @IBOutlet weak var BtNext: UIButton!
    
    @IBAction func btClear(_ sender: Any) {
        t1.text = ""
        t2.text = ""
        t3.text = ""
        t4.text = ""
        t5.text = ""
        t6.text = ""
        iv1.image = nil
        
        t1.isEnabled = true
        t1.backgroundColor = UIColor.white
        
        BtModify.isEnabled = false
        BtAdd.isEnabled = true
        BtDelete.isEnabled = false
    }
    
    @IBAction func btAdd(_ sender: Any) {
        
        let d1:Date? = date1.date as Date?
        CoreDataManager.shared.addStudent(sid: t1.text ?? "", sname: t2.text ?? "", sclass: t3.text ?? "", sage: Int32(t4.text ?? "0")!, sh:Int32(t5.text ?? "0")!, sw: Int32(t6.text ?? "0")!, simg: iv1.image,sBorn:d1!)
        DataShare.shared.students = CoreDataManager.shared.getAllStudent()
    }
    
    @IBAction func btModify(_ sender: Any) {
        let d1:Date? = date1.date as Date?
        CoreDataManager.shared.changeStudentWith(sid: t1.text ?? "", sname: t2.text ?? "", sclass: t3.text ?? "", sage: Int32(t4.text ?? "0")!, sh:Int32(t5.text ?? "0")!, sw: Int32(t6.text ?? "0")!, simg: iv1.image, sBorn:d1!)
        
        DataShare.shared.students = CoreDataManager.shared.getAllStudent()
        
        
    }
    
    
    @IBAction func btDelete(_ sender: Any) {
        CoreDataManager.shared.deleteWith(sid: t1.text!)
        DataShare.shared.students = CoreDataManager.shared.getAllStudent()
        
        t1.text = ""
        t2.text = ""
        t3.text = ""
        t4.text = ""
        t5.text = ""
        t6.text = ""
        iv1.image = nil
        
        t1.isEnabled = true
        t1.backgroundColor = UIColor.white
        
        BtModify.isEnabled = false
        BtAdd.isEnabled = true
        BtDelete.isEnabled = false
       
    }
    
    @IBAction func btLast(_ sender: Any) {
        DataShare.shared.student_select -= 1
        DataShare.shared.from = "UIedit"
        if( DataShare.shared.student_select < 0){
            DataShare.shared.student_select = DataShare.shared.students.count-1
        }
        
        showStudent(index:DataShare.shared.student_select)    }
    
    @IBAction func btNext(_ sender: Any) {
        DataShare.shared.student_select += 1
        DataShare.shared.from = "UIedit"
        if( DataShare.shared.student_select >= DataShare.shared.students.count){
            DataShare.shared.student_select = 0
        }
        showStudent(index:DataShare.shared.student_select)
    }
    
    
    @IBAction func selectImage(_ sender: Any) {
        DataShare.shared.info = "photoEdit"
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true,completion: nil)
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
    override func viewWillAppear(_ animated: Bool) {
        if(DataShare.shared.info == "photoEdit"){
            DataShare.shared.info = ""
            
        }
        else{
            showStudent(index:DataShare.shared.student_select)
            BtModify.isEnabled = true
            BtAdd.isEnabled = false
            BtDelete.isEnabled = true
            
        }
    }
    func showStudent(index:Int){
        if(index >= 0 && index < DataShare.shared.students.count){
            let s = DataShare.shared.students[index]
            t1.text = s.s_id
            t2.text = s.s_name
            t3.text = s.s_class
            t4.text = "\(s.s_age)"
            t5.text = "\(s.s_h)"
            t6.text = "\(s.s_w)"
            date1.date = s.s_born!
            if s.s_image == nil{
                iv1.image = nil
            }
            else{
                iv1.image = UIImage(data: s.s_image as! Data)}
            t1.isEnabled = false
            t1.backgroundColor = UIColor.lightGray
            BtModify.isEnabled = true
            BtDelete.isEnabled = true
            
        }
    }

    

}

extension ViewControllerEdit:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        iv1.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
        
    }
}
