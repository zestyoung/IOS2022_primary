//
//  Student+CoreDataProperties.swift
//  2018051001郑煜test3
//
//  Created by 郑煜 on 2022/3/8.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var s_id: String?
    @NSManaged public var s_name: String?
    @NSManaged public var s_class: String?
    @NSManaged public var s_age: Int16

}

extension Student : Identifiable {

}
