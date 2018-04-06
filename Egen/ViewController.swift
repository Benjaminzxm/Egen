//
//  ViewController.swift
//  Egen
//
//  Created by YinjianChen on 2018/3/5.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let eventNum = Observable.from(["1","2","3","4","5","6","7"]).map { Int($0)}
//            .filter {
//                if let item = $0, item % 2 == 0{
//                    print("event \(item)")
//                    return true
//                }
//                return false
//        }
//
//        eventNum.subscribe(
//            onNext:{event in print("onNext \(String(describing: event))")},
//            onError:{ print($0)},
//            onCompleted:{print("complete")}
//        )
//
//        let toggleSwitch = UISwitch.init(frame: CGRect(x: 20, y: 20, width: 40, height: 30))
//        view.addSubview(toggleSwitch)
//        toggleSwitch.rx.isOn
//            .subscribe({ enable in
//                print(enable)
//            })
    }


}

