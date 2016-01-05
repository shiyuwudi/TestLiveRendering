//
//  ViewController.swift
//  TestLiveRendering
//
//  Created by apple2 on 16/1/5.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myButton: MyButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        myButton.backgroundColor = UIColor.yellowColor()
        view .addSubview(myButton)
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
    
    @IBInspectable var midSpace:CGFloat
    @IBInspectable var midXRatio:CGFloat
    @IBInspectable var imageW:CGFloat
    @IBInspectable var imageH:CGFloat
    
    @IBInspectable var fontSize:CGFloat
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let w = contentRect.width
        let h = contentRect.height
        let w1 = midXRatio * w - midSpace
        let h1 = h
        let x1 = midXRatio * w + midSpace
        let y1 = 0 as CGFloat
        let frame = CGRect.init(x: x1, y: y1, width: w1, height: h1)
        return frame
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let w = contentRect.width
        let h = contentRect.height
        let w1 = imageW
        let h1 = imageH
        let x1 = midXRatio * w - midSpace - w1
        let y1 = 0.5 * (h - h1)
        let frame = CGRect.init(x: x1, y: y1, width: w1, height: h1)
        return frame
    }
    
    override init(frame: CGRect) {
        
        //初始化
        midSpace = 5
        midXRatio = 0.5
        imageW = 44
        imageH = 44
        fontSize = 18
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        
        //初始化
        midSpace = 5
        midXRatio = 0.5
        imageW = 44
        imageH = 44
        fontSize = 18
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
}

