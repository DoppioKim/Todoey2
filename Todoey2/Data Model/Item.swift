//
//  Item.swift
//  Todoey2
//
//  Created by Jiyoung on 21/05/2019.
//  Copyright © 2019 Jiyoung Kim. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {

    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated : Date?
    

    
    let parentCategory = LinkingObjects(fromType: Category.self , property: "items")
    
}
