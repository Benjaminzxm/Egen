//
//  TaskService.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/7.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm

struct TastService:TaskServiceType {
    
    init(){
        do {
            let realm = try Realm()
            if realm.objects(TaskItem.self).count == 0 {
                ["Chapter 5: Filtering operators",
                 "Chapter 4: Observables and Subjects in practice",
                 "Chapter 3: Subjects",
                 "Chapter 2: Observables",
                 "Chapter 1: Hello, RxSwift"].forEach {
                    self.createTask(title: $0)
                }
            }
        } catch _ {
        }
  
    }
    
    fileprivate func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T? {
        do {
            let realm = try Realm()
            return try action(realm)
        } catch let err {
            print("Failed \(operation) realm with error: \(err)")
            return nil
        }
    }
    
    @discardableResult
    //其实和常规realm操作差别不大，就是数据模型对象可被观察而已
    func createTask(title: String) -> Observable<TaskItem> {
        let result = withRealm("creating") { realm -> Observable<TaskItem> in
            let task = TaskItem()
            task.title = title
            try realm.write {
                task.uid = (realm.objects(TaskItem.self).max(ofProperty: "uid") ?? 0) + 1
                realm.add(task)
            }
            return .just(task)
        }
        return result ?? .error(TaskServiceError.creationFailed)
    }
    
    @discardableResult
    func delete(task: TaskItem) -> Observable<Void> {
        let result = withRealm("deleting") { realm-> Observable<Void> in
            try realm.write {
                realm.delete(task)
            }
            return .empty()
        }
        return result ?? .error(TaskServiceError.deletionFailed(task))
    }
    
    @discardableResult
    func update(task: TaskItem, title: String) -> Observable<TaskItem> {
        let result = withRealm("updating title") { realm -> Observable<TaskItem> in
            try realm.write {
                task.title = title
            }
            return .just(task)
        }
        return result ?? .error(TaskServiceError.updateFailed(task))
    }
    
    @discardableResult
    func toggle(task: TaskItem) -> Observable<TaskItem> {
        let result = withRealm("toggling") { realm -> Observable<TaskItem> in
            try realm.write {
                if task.checked == nil {
                    task.checked = Date()
                } else {
                    task.checked = nil
                }
            }
            return .just(task)
        }
        return result ?? .error(TaskServiceError.toggleFailed(task))
    }
    
    //一个函数返回值，一个闭包的return
    func tasks() -> Observable<Results<TaskItem>> {
        let result = withRealm("getting tasks") { realm -> Observable<Results<TaskItem>> in
            let realm = try Realm()
            let tasks = realm.objects(TaskItem.self)
            return Observable.collection(from: tasks)
        }
        return result ?? .empty()
    }
}
