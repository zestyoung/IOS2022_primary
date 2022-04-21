//
//  student.swift
//  2018051001郑煜test2
//
//  Created by 郑煜 on 2022/3/4.
//

import Foundation

class Student{
    var s_id:String = ""
    var s_name:String = ""
    var s_class:String = ""
    var s_age:Int32 = 0
    init(sid:String,sname:String,sclass:String,sage:Int32) {
        s_id = sid
        s_name = sname
        s_class = sclass
        s_age = sage
    }
    init(sKey:String,sValue:String) {
        s_id = GetPropString(sValue as NSString, "学号" as NSString)
        s_name = GetPropString(sValue as NSString, "姓名" as NSString)
        s_class = GetPropString(sValue as NSString, "班级" as NSString)
        s_age = Int32(GetPropString(sValue as NSString, "年龄" as NSString))!
    }
    
    func GetPropString(_ values:NSString,_ prop:NSString)->String{
        let range1 = values.range(of: "<\(prop)>")
        let range2 = values.range(of: "</\(prop)>")
        if range1.location != NSNotFound && range2.location != NSNotFound{
            return values.substring(with: NSRange.init(location: range1.location + range1.length,length: range2.location - range1.location - prop.length - 2))
        }else{
            return ""    }
    }
    //let a = "<姓名>章三</姓名><班级>应用161</班级><年龄>18</年龄>"
    //let b =  GetPropString(a as NSString,"姓名" as NSString)
    //let c =  GetPropString(a as NSString,"班级" as NSString)
    //let d =  GetPropString(a as NSString,"年龄" as NSString)
    
    
    func GetKey()->String{
        return "\(s_id)"
    }
    func getValue()->String{
        //return "\(s_name),\(s_class)"
        return "<学号>\(s_id)</学号><姓名>\(s_name)</姓名><班级>\(s_class)</班级><年龄>\(s_age)</年龄>"
    }
}
