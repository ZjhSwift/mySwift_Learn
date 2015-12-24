//
//  ViewController.swift
//  Swift_Control
//
//  Created by 张锦辉 on 15/12/15.
//  Copyright © 2015年 张锦辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {//继承协议
    
    var myLabel:UILabel = UILabel()
    var myButton: UIButton = UIButton()
    var myTextField:UITextField = UITextField()
    var myTextView:UITextView = UITextView()
    var myImageView: UIImageView = UIImageView()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.startAnimating()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.stopAnimating()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.myButton = createMyButton()
        self.view .addSubview(self.myButton)
        self.myLabel = createMyLabel()
        self.view .addSubview(self.myLabel)
        self.myTextField = createMyTextField()
        self.view .addSubview(self.myTextField)
        self.myTextView = createMyTextView()
        self.view .addSubview(self.myTextView)
        createImageView()
        createBtns()
        
    }
    
    
    /************************************UIlabel*************************************/
    func createMyLabel() -> UILabel {
    //z-k13552997025
        let label:UILabel = UILabel(frame: CGRectMake(10, 20, self.view.frame.size.width - 20, 40))
        label.backgroundColor = UIColor.greenColor()
        label.text = "this is my First label this is my First label ";
        label.numberOfLines = 0
        //字体的设置
        label.font = UIFont.systemFontOfSize(13)
        label.font = UIFont (name: "Zapfino", size: 13)//字体的类型
        //文字居中
        label.textAlignment = NSTextAlignment.Center//Right，Left
        //文字的阴影
        label.shadowColor = UIColor.whiteColor()
        label.shadowOffset = CGSizeMake(-1, 1)
        //文字的省略方式
        //NSLineBreakMode.ByTruncatingTail表示隐藏尾部并显示省略号
        //NSLineBreakMode.ByTruncatingMiddle表示隐藏中间部分并且显示省略号
        //NSLineBreakMode.ByTruncatingHead表示影藏头部文字并且显示省略号
        //NSLineBreakMode.ByClipping 截取多余的部分不显示省略号
        label.lineBreakMode = NSLineBreakMode.ByClipping
        //全部显示文字
        label.adjustsFontSizeToFitWidth = true//字体大小会随着宽度变化而变化
        
        return label;
    }
    
    
    /************************************** UIButton******************************/
    func createMyButton() ->UIButton {
        let btn:UIButton = UIButton(frame: CGRectMake(10, 70, self.view.frame.size.width - 20, 30))
        btn.backgroundColor = UIColor.blueColor()
        btn.setTitle("to MyViewController", forState: UIControlState.Normal)
        btn .addTarget(self, action:"btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        btn.titleLabel?.textAlignment = NSTextAlignment.Center;
        btn.titleLabel?.textColor  = UIColor.whiteColor()

        return btn;
    }
    
    func btnClick(){
        
        let my:MyViewController = MyViewController()
        my.create()
        self.presentViewController(my, animated: true, completion: nil)
    }
    
    
    
    /*******************************************TextField*****************************/
    //基本设置和label一样
    func createMyTextField() -> UITextField {
    
        let field : UITextField = UITextField (frame: CGRectMake(10, 110, self.view.frame.size.width-20, 40))
        //文本框的边框样式
        //borderStyle = UITextBorderStyle.Line/Bezel
        field.borderStyle = UITextBorderStyle.RoundedRect
      
        //文本的样式
        field.placeholder = "this if my first TextField"//提示字
        field.text = "jinhui.zhang"
        field.minimumFontSize = 13//设置最小缩小的字号
        
        //文本的对齐方式，不只有现在知道的左中右对齐方式，还是上中下对齐方式
        //contentVerticalAlignment = UIControlContentVerticalAlignment.Top/Center/Bottom
        field.contentVerticalAlignment = .Top//省略方式
        
        //键盘样式
        //UIReturnKeyType.Done/Go/Join/Join/Send/Next/Send/Search
        //field.returnKeyType = UIReturnKeyType.Done
        field.returnKeyType = .Go
        
        //协议
        field.delegate = self
        
        //清除按钮
        //clearButtonMode = UITextFieldViewMode.WhileEditing/UnlessEditing(完成后出现)/Always/Never
        field.clearButtonMode = UITextFieldViewMode.WhileEditing//表示编辑时出现
        
        return field
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        print(textField.text)
        
        return true
    }
    
    /****************************** UITextView ********************************/
    
    func createMyTextView() ->UITextView {
    
        let myText:UITextView = UITextView(frame: CGRectMake(10, 160, self.view.frame.size.width-20, 60))
        myText.layer.borderColor = UIColor.grayColor().CGColor
        myText.layer.borderWidth = 1
        myText.editable = true//false表示不能输入
        myText.text = "www.baidu.com"
        
        //创建链接
        //dataDetectorTypes = UIDataDetectorTypes.All/PhoneNumber(电话)/Link(网络连接)
        myText.dataDetectorTypes = UIDataDetectorTypes.Link//
    
        //最重要的代理：resignFirstResponde
        return myText
        
    }
    
    /*****************************UIImangeView********************/
    
    var imageView:UIImageView!
    func createImageView() {
    
        imageView = UIImageView()
        imageView.frame = CGRectMake((self.view.frame.width - 100)/2, myTextView.frame.origin.y + 70, 100,100)
        //设置动画
        imageView.animationImages = [UIImage(named: "2.jpg")!,UIImage(named: "1.jpg")!]
        imageView.animationDuration = 1//每隔1秒切换一次
        self.view.addSubview(imageView)
    }
    
    var toBtn:UIButton!
    func createBtns() {
        
        for var index:CGFloat = 1.0 ;index < 4.0; ++index {
            toBtn = UIButton(type: .Custom)
            toBtn.tag = NSInteger(index + 100)
            toBtn.frame = CGRectMake(10, imageView.frame.origin.y + 100.0 + index*(30.1+5) ,self.view.frame.width-20, 30)
            toBtn.backgroundColor = UIColor.grayColor()
            toBtn.titleLabel?.textColor = UIColor.whiteColor()
            toBtn.setTitle("viewControl:\(index)", forState: .Normal)
            
            toBtn .addTarget(self, action: "toOtherView:", forControlEvents: .TouchUpInside)
            
            self.view .addSubview(toBtn)
        }
    }
    
    func toOtherView(button:UIButton) {
        
        if button.tag == 101 {
            let gistView:GistViewController = GistViewController()
            self.presentViewController(gistView, animated: true, completion: nil)
        }
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

