//
//  BindableType.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/7.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol BindableType {
    associatedtype ViewModelType
    var viewModel: ViewModelType! {get set}
    func bindViewModel()
}

extension BindableType where Self:UIViewController{
    
    mutating func bindViewModel(to model:Self.ViewModelType){
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }

    
}
