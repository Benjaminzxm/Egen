//
//  ItemCell.swift
//  Egen
//
//  Created by YinjianChen on 2018/4/8.
//  Copyright © 2018年 YinTokey. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class ItemCell: UICollectionViewCell {
    var titleLabel:UILabel!
    var imageView:UIImageView!
    var disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView.init(frame: CGRect(x:0,y:0,width:frame.size.width,height:frame.size.height - 30))
        self.contentView.addSubview(imageView)
        
        titleLabel = UILabel.init(frame: CGRect(x:0,y:frame.size.height - 30,width:frame.size.width,height:30))
        titleLabel.textColor = UIColor.white
        self.contentView.addSubview(titleLabel)
        
        self.contentView.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
