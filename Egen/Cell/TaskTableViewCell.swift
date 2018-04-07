//
//  TaskTableViewCell.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/7.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import UIKit
import RxSwift
import Action

class TaskTableViewCell: UITableViewCell {

    var title:UILabel!
    var button:UIButton!
    var disposeBag = DisposeBag()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        title = UILabel.init(frame:CGRect(x: 0, y: 0, width: 250, height: 80))
        button = UIButton.init(frame: CGRect(x: 280, y: 0, width: 50, height: 80))
    
        self.contentView.addSubview(title)
        self.contentView.addSubview(button)
        
    }
    
    func configure(with item:TaskItem,action:CocoaAction){
        button.rx.action = action
        //监听 item.title 属性，变化值更新于 label上
        item.rx.observe(String.self, "title")
            .subscribe(onNext:{[weak self] title in
                self?.title.text = title
            })
            .disposed(by: disposeBag)
        item.rx.observe(Date.self,"checked")
            .subscribe(onNext:{[weak self] date in
                let color:UIColor!
                if(date == nil){
                    color = UIColor.blue
                }else{
                    color = UIColor.green
                }
                self?.button.backgroundColor = color
            })
            .disposed(by: disposeBag)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        button.rx.action = nil
        DisposeBag = DisposeBag()
        super.prepareForReuse()
    }
    
}
