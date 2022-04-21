//
//  Student.swift
//  2018051001郑煜test5
//
//  Created by 郑煜 on 2022/3/15.
//

import UIKit
class Student{
    var s_id = ""
    var s_name = ""
    var s_class = ""
    var s_age:Int32 = 0
    var s_image:UIImage?
    init?(sid:String,sname:String,sclass:String,sage:Int32,simage:UIImage){
        s_id = sid
        s_name = sname
        s_class = sclass
        s_age = sage
        s_image = simage
        
    }
    
}
