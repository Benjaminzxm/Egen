//
//  SceneCoordinatorType.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/7.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import Foundation
import RxSwift

enum SceneTransitionType {
    case root       // make view controller the root view controller
    case push       // push view controller to navigation stack
    case modal      // present view controller modally
}


protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType) -> Completable
    
    @discardableResult
    func pop(animated: Bool) -> Completable
}

extension SceneCoordinatorType {
    @discardableResult
    func pop() -> Completable {
        return pop(animated: true)
    }
}
