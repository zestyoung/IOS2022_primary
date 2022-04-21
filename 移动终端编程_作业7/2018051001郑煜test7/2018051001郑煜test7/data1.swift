//
//  data1.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/22.
//

import UIKit
import CoreData

class DataShare{
    static let shared = DataShare()
    var students = [Student]()
    var info = ""
    var from = ""
    var student_select = -1
    
}


class CoreDataManager: NSObject {
    
    // 单例
    static let shared = CoreDataManager()
    
    // 拿到AppDelegate中创建好了的NSManagedObjectContext
    lazy var context: NSManagedObjectContext = {
        let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
        return context
    }()
    
    // 更新数据
    private func saveContext() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    func addStudent(sid:String,sname: String,sclass:String,sage:Int32,sh:Int32,sw:Int32,simg:UIImage?,sBorn:Date) {
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.s_id = sid
        student.s_name = sname
        student.s_class = sclass
        student.s_age = sage
        student.s_h = sh
        student.s_w = sw
        student.s_born = sBorn
        if(simg != nil){
            student.s_image =  simg!.pngData()! as Data
        }else{
            student.s_image = nil
        }
        saveContext()
    }
    
    // 根据 条件 获取数据
    
    func getStudentWith(condition: String) -> [Student] {
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: condition)
        do {
            let result: [Student] = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    // 获取所有数据
    func getAllStudent() -> [Student] {
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    // 根据学号修改数据
    
    func changeStudentWith(sid:String,sname: String,sclass:String,sage:Int32,sh:Int32,sw:Int32,simg:UIImage?,sBorn:Date) {
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "s_id == %@", sid)
        do {
            let result = try context.fetch(fetchRequest)
            
            for student in result {
                //student.s_id = sid
                student.s_name = sname
                student.s_class = sclass
                student.s_age = sage
                student.s_h = sh
                student.s_w = sw
                student.s_born = sBorn
                if(simg != nil){
                    student.s_image =  simg!.pngData()! as Data
                }else{
                    student.s_image = nil
                }
            }
        } catch {
            fatalError();
        }
        saveContext()
    }
    
    // 根据姓名删除数据
    func deleteWith(sid: String) {
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "s_id == %@", sid)
        do {
            let result = try context.fetch(fetchRequest)
            for person in result {
                context.delete(person)
            }
        } catch {
            fatalError();
        }
        saveContext()
    }
}
