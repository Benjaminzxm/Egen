//
//  ViewController.swift
//  Egen
//
//  Created by YinjianChen on 2018/3/5.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
       var eventNum = Observable.from(["1","2","3","4","5","6","7"]).map { Int($0)}
            .filter {
                if let item = $0, item % 2 == 0{
                    print("event \(item)")
                    return true
                }
                return false
        }
        
        eventNum.subscribe(
            onNext:{event in print("onNext \(String(describing: event))")},
            onError:{ print($0)},
            onCompleted:{print("complete")}
        )
    }

}

