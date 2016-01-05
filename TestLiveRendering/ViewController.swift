//
//  ViewController.swift
//  TestLiveRendering
//
//  Created by apple2 on 16/1/5.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

@IBDesignable
class MyView:UIView {
    
    var btn:UIButton!
    let screenSize = UIScreen .mainScreen().bounds.size
    
    @IBInspectable var cornerRadius:CGFloat
    @IBInspectable var title:NSString
    @IBInspectable var backColor:UIColor
    @IBInspectable var fontSize:CGFloat
    
    override init(frame: CGRect) {
        
        //初始化
        cornerRadius = 0
        title = "Title"
        backColor = UIColor .redColor()
        fontSize = 17.0
        super.init(frame: frame)
        
        //使用变量
        let x = 0.5 * (screenSize.width - 100)
        let y = 0.5 * (screenSize.height - 100)
        btn = UIButton.init(frame: CGRect.init(x: x, y: y, width: 100, height: 100))
        btn.backgroundColor = backColor
        btn.layer.cornerRadius = cornerRadius
        btn.layer.masksToBounds = true
        btn.setTitle(title as String, forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        addSubview(btn)
    }

    required init?(coder aDecoder: NSCoder) {
        //初始化
        cornerRadius = 0
        title = "Title"
        backColor = UIColor .redColor()
        fontSize = 17.0
        super.init(coder: aDecoder)
        
        //使用变量
        let x = 0.5 * (screenSize.width - 100)
        let y = 0.5 * (screenSize.height - 100)
        btn = UIButton.init(frame: CGRect.init(x: x, y: y, width: 100, height: 100))
        btn.backgroundColor = backColor
        btn.layer.cornerRadius = cornerRadius
        btn.layer.masksToBounds = true
        btn.setTitle(title as String, forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        addSubview(btn)
    }
    
    override func layoutSubviews() {
        //更新视图
        btn.layer.cornerRadius = cornerRadius
        btn.setTitle(title as String, forState: .Normal)
        btn.backgroundColor = backColor
        btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
    
}

@IBDesignable
class MyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
    }
}

