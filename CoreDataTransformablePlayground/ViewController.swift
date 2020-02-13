//
//  ViewController.swift
//  CoreDataTransformablePlayground
//
//  Created by Raphael-Alexander Berendes on 13.02.20.
//  Copyright © 2020 Raphael-Alexander Berendes. All rights reserved.
//

import CoreData
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        var myModels = [MyModel]()

        for _ in 1...10 {

            let model = MyModel(name: "Name", age: 100)
            myModels.append(model)
        }

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let testEntity = TestEntity(entity: TestEntity.entity(), insertInto: appDelegate.persistentContainer.viewContext)
        testEntity.amount = 999
        testEntity.myModels = myModels

        appDelegate.saveContext()
    }

    @IBAction func buttonWasButtoned(_ sender: Any) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let fetchRequest = NSFetchRequest<TestEntity>(entityName: TestEntity.entity().name!)

        do {
            let testEntities = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            print(testEntities)
        } catch {
            print(error)
        }
    }

}

