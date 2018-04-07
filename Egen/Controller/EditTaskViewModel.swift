//
//  EditTaskViewModel.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/7.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import Foundation
import RxSwift
import Action

struct EditTaskViewModel{
    
    let itemTitle: String
    let onUpdate: Action<String, Void>
    let onCancel: CocoaAction!
    let disposeBag = DisposeBag()
    
    init(task: TaskItem, coordinator: SceneCoordinatorType, updateAction: Action<String, Void>, cancelAction: CocoaAction? = nil) {
        
        itemTitle = task.title
        onUpdate = updateAction
        onCancel = CocoaAction {
            if let cancelAction = cancelAction {
                cancelAction.execute(())
            }
            return coordinator.pop()
                .asObservable().map { _ in }
        }
        
        onUpdate.executionObservables
            .take(1)
            .subscribe(onNext:{ _ in
                coordinator.pop()
            })
            .disposed(by: disposeBag)
        
        
    }
}
