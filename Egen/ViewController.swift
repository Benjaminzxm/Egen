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
    var tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width:414, height: 718))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        self.testBehaviorSubject()
    }


    func test1(){
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
        //            })}
    
    }
    
    func testPublishSubject(){
        let disposeBag = DisposeBag()
        let publishSubject = PublishSubject<String>()
        publishSubject.subscribe{ e in
            print("subscription 1, event: \(e)")
            
            }.disposed(by: disposeBag)
        
        publishSubject.on(.next("a"))
        publishSubject.onNext("b")
        
        publishSubject.subscribe{ e in
            print("subscription 2, event \(e)")
            
            }.disposed(by: disposeBag)
        
        publishSubject.onNext("c")
        publishSubject.onNext("d")
    }
    
    func testBehaviorSubject(){
        let behaviorSubject = BehaviorSubject.init(value: "z")
        behaviorSubject.subscribe{ e in
            print("sub1 ,event : \(e)")
        }
        
        
    }
}

