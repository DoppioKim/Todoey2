//
//  Category.swift
//  Todoey2
//
//  Created by Jiyoung on 21/05/2019.
//  Copyright © 2019 Jiyoung Kim. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
