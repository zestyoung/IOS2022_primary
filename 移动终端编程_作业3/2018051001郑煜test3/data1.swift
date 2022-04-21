//
//  data1.swift
//  2018051001郑煜test3
//
//  Created by 郑煜 on 2022/3/8.
//

import UIKit
import CoreData

class CoreDataManager:NSObject{
    
    static let shared = CoreDataManager()
    
    lazy var context:NSManagedObjectContext = {
        let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
        return context
    }()
    
    private func saveContext(){
        do{
            try context.save()
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func addStudent(sid:String, sname:String, sclass:String, sage:Int16){
        let Student = NSEntityDescription.insertNewObject(forEntityName:"Student", into:context) as! Student;
        
        Student.s_id = sid;
        Student.s_name = sname;
        Student.s_class = sclass;
        Student.s_age = Int16(sage);
        
        saveContext();
    }
    
    func getStudentWith(id:String)->[Student]{
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "s_id == %@", id)
        do{
            let result:[Student] = try context.fetch(fetchRequest)
            return result;
        }
        catch{
            fatalError()
        }
    }
    
    func getStudentWith(condition:String)->[Student]{
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "sname = %@", condition)
        do{
            let result:[Student] = try context.fetch(fetchRequest)
            return result
        }
        catch{
            fatalError()
        }
    }
    
    func getAllStudent() -> [Student]{
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        do{
            let result = try context.fetch(fetchRequest)
            return result
        }
        catch{
            fatalError()
        }
    }
    
    func changeStudentWitch(sid:String, sname:String, sclass:String, sage:Int16){
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "s_id = %@", sid)
        do{
            let result = try context.fetch(fetchRequest)
            for student in result{
                student.s_name = sname
                student.s_class = sclass
                student.s_age = Int16(sage)
            }
        }
        catch{
            fatalError()
        }
        saveContext()
    }
    
    func deleteWith(sid:String){
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "s_id = %@", sid)
        do{
            let result = try context.fetch(fetchRequest)
            for person in result{
                context.delete(person)
            }
        }
        catch{
            fatalError()
        }
        saveContext()
    }
    
    func deleteAllPerson(){
        let result = getAllStudent()
        for person in result{
            context.delete(person)
        }
        saveContext()
    }
}
