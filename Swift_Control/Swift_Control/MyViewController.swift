//
//  MyViewController.swift
//  Swift_Control
//
//  Created by 张锦辉 on 15/12/15.
//  Copyright © 2015年 张锦辉. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var backBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        backBtn = UIButton();
        backBtn.frame = CGRectMake(5, 20, 60, 30)
        backBtn.backgroundColor = UIColor.blueColor()
        backBtn .setTitle("back", forState: UIControlState.Normal)
        backBtn.addTarget(self, action: "backClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(backBtn)
        
        //各种控件
        createUISwitch()
        createUISegmentedControl()
        createUISlider()
        createUIStepper()
        createUIprogressView()
    }
    
    
    /********************************UISwitch***********************/
    var uiswitch:UISwitch!
    func createUISwitch() {
        uiswitch = UISwitch()
        uiswitch.center = CGPointMake(self.view.frame.size.width/2, 60)
        uiswitch.on = true;
        uiswitch .addTarget(self, action: "switchDidChange", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(uiswitch)
    }
    
    func switchDidChange() {
        print("开关状态",uiswitch.on)
    }
    
    /*********************************UISegmentedControl*************************************/
    var segmented:UISegmentedControl!
    func createUISegmentedControl() {
        let items = ["选项1","选项2","选项3"]
        segmented = UISegmentedControl(items: items)
        segmented.center = CGPointMake(self.view.frame.size.width/5, 100)
        segmented.selectedSegmentIndex = 1
        
        //改变着色
        segmented.tintColor = UIColor.redColor()
        //修改选项的文字
        segmented.setTitle("swift1", forSegmentAtIndex: 1)
        //修改选项中的图片
        //segmented.setImage(UIImage(named: ""), forSegmentAtIndex: 2)
        //设置选项内容的偏移量
        segmented.setContentOffset(CGSizeMake(5, 10), forSegmentAtIndex: 1)
        //新增加一个项
        segmented.insertSegmentWithTitle("newAdd1", atIndex: 1, animated: true)
        //插入图片项
        segmented.insertSegmentWithImage(UIImage(named: "Lock@2x"), atIndex: 2, animated: true)
        //删除选项
        segmented.removeSegmentAtIndex(0, animated: true)
        //segmented.removeAllSegments()删除全部

        //监听事件
        segmented.addTarget(self, action: "segenmentedDidChange", forControlEvents: UIControlEvents.ValueChanged)
        self.view .addSubview(segmented)
    }
    
    func segenmentedDidChange() {
    
        print("选择了第",segmented.selectedSegmentIndex,"项",segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex))
    }
    
    
    /**********************************UISlider**********************************/
    var slider:UISlider!
    func createUISlider () {
        
        slider = UISlider(frame:CGRectMake((self.view.frame.size.width-200)/2, 160, 200, 30))
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0
        
        //滑块的值的通知机制
        slider.continuous = true//如果continuous属性设置为false，就是当滑块停止后才会触发ValueChange
        slider.addTarget(self, action: "sliderDidChange", forControlEvents: .ValueChanged)//这两个是配套的
        
        //滑块的样式
        slider.minimumTrackTintColor = UIColor.redColor()
        slider.maximumTrackTintColor = UIColor.greenColor()
        
        //滑块左右图面
        slider.minimumValueImage = UIImage (named: "User@2x")
        slider.maximumValueImage = UIImage (named: "Lock@2x")
        
        //其实slider是有三部分图片组成，因此很方便对滑块进行外观的定制
        slider.setMaximumTrackImage(UIImage (named: "max"), forState: .Normal)
        slider.setMinimumTrackImage(UIImage (named: "min"), forState: .Normal)
        slider.setThumbImage(UIImage (named: "slider@2x"), forState: .Normal)
        
        
        self.view .addSubview(slider)
    }
    
    func sliderDidChange (){
        
        print("进度 ",slider.value)
        progress.progress = slider.value
    }
    
    
    /*******************************UIStepper********************************/
     
    var stepper:UIStepper!
    func createUIStepper() {
        stepper = UIStepper()
        stepper.center = CGPointMake(self.view.frame.size.width/2, 210)
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 1
        stepper.stepValue = 0.5
        
        //设置stepper可以按住不放连续更改值
        stepper.continuous = true
        //设置step是否循环(到最大值时候在增加数值时从最小开始)
        stepper.wraps = true
        
        stepper.addTarget(self, action: "stepperDidChange", forControlEvents: .ValueChanged)
        self.view .addSubview(stepper)
    }
    
    func stepperDidChange() {
    
        print("数值:",stepper.value)
    }

    /*******************************UIProgressView*******************************/
    var progress:UIProgressView!
    func createUIprogressView() {
        progress = UIProgressView(progressViewStyle: .Default)
        progress.center = CGPointMake(self.view.frame.size.width/2, 130)
        progress.progress = slider.value
        self.view .addSubview(progress)
    }
    
    
    
    func backClick() {
        self .dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func create() {
    
        print("调到了我的页面")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
