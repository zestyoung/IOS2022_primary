//
//  Student+CoreDataProperties.swift
//  2018051001郑煜test7
//
//  Created by 郑煜 on 2022/3/25.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var s_age: Int32
    @NSManaged public var s_born: Date?
    @NSManaged public var s_class: String?
    @NSManaged public var s_h: Int32
    @NSManaged public var s_id: String?
    @NSManaged public var s_image: Data?
    @NSManaged public var s_name: String?
    @NSManaged public var s_w: Int32

}

extension Student : Identifiable {

}
