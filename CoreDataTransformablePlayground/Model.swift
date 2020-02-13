//
//  Model.swift
//  CoreDataTransformablePlayground
//
//  Created by Raphael-Alexander Berendes on 13.02.20.
//  Copyright © 2020 Raphael-Alexander Berendes. All rights reserved.
//

import Foundation

public class MyModel: NSObject, NSCoding {

    let name: String
    let age: Int64

    init(name: String, age: Int64) {

        self.name = name
        self.age = age
    }

    required public init?(coder aDecoder: NSCoder) {

        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.age = aDecoder.decodeInt64(forKey: "age")
    }

    public func encode(with aCoder: NSCoder) {

        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
    }
}
