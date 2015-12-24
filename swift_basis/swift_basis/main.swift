//
//  main.swift
//  swift_basis
//
//  Created by 张锦辉 on 15/12/18.
//  Copyright © 2015年 张锦辉. All rights reserved.
//

import Foundation

print("Hello, World!")

/********************* 字符串和字符 *********************/

var samplStr:String
var keyNote = "someNote"
if keyNote.isEmpty {
    print(keyNote)
}

samplStr = keyNote + "is not null"

//字符串是支持字符串插值的
let game = "2048"
print("helle my program name is \(game)")

var isRadius = 6
print("the circle area is \(Double(isRadius) * 3.1415926)")

//字符
let LogTitle = "swift is a new object-oriented programing language for ios and os x development"
let LogTitle2 = "swift is a new object-oriented programing language"


//字符串和字符串的操作
//比较
if LogTitle == LogTitle2 {

    print("两个字符串相等")
}else {

    print("两字符串不相等")
}

//检查swift是否有前后缀（）
var Strs = [
    "Warming:this is warming1.",
    "Warming:this is warming2.",
    "Error:this is error1."
]

var warmCount = 0
var errorCount = 0
var suffCount = 0

for str in Strs {
    if str.hasPrefix("Warming") {//前缀的测试
        ++warmCount
    }
    
    if str.hasPrefix("Error") {
        ++errorCount
    }
}
print("Warming hs \(warmCount);Error has \(errorCount)")

for str in Strs {

    if str.hasSuffix("1.") {//后缀的测试
        ++suffCount
    }
}
print("suffix has \(suffCount)")


//string类型 大/小(uppercaseString/lowercaseString)写的转变
let str1 = "ABCDE"
let str2 = "abcde"

var str3 = str1.lowercaseString//把str1转变成小写
//str2.uppercaseString
if str3 == str2 {
    print(str1,"is",str2,"upporcase")
}

/*************  **************************************元组 ***********************************/
//：用来归类多个具有任何意义类型的相关联的值

let http404Error = (404,"Not Found")

//解绑元组的四种方式
let (code,message) = http404Error
print("状态码：\(code),状态：\(message)")

let (code1,_) = http404Error
let (_,messge1) = http404Error
print("状态码：\(code1),message:\(messge1)")

print("code:\(http404Error.0),message:\(http404Error.1)")

let http200OK = (code3:200,message3:"OK")
print("code:\(http200OK.code3),message:\(http200OK.message3)")

/**************************************可选类型（Optional） ****************************/
//主要解决有何无的问题
//声明一个可选型的变量和常量
let optionalInt: Int? = 100
var otritonString: String? = "hello world"


let possibleNum = "123"
//通过这个方法把字符串转变成整型
let converNum:Int? = Int(possibleNum)
//1,if语句和强制解封可选类
if (converNum != nil) {
    print("\(possibleNum) has Int: \(converNum!)")
}else {
    print("\(possibleNum) can`t change Int")
}

//2,可选绑定
if let actualNum = Int(possibleNum) {

    print("\(possibleNum) has Int : \(actualNum)")
}else {

    print("\(possibleNum) has no Int" )
}

//隐式解封可选类型
let pstr1 :String? = "可选类型字符串"
let cstr2:String! = "隐式解封的可选类型"



/*********************** 集合 ****************/

/*
swift中提供了两种集合，一种是Array，一种是Dictionary
*/


//数组的两种写法：Array<SomeType>;[SomeType]
//如果现实数据类型时，里面的元素就必须是该类型
var shoppingList:[String] = ["Eggs","Milk"]
//定义式不指定数据类型
var ArrList = ["Eggs",123,23.4,true]
for item in ArrList {
    print("ArrList中得元素:\(item)")
}



//一、访问和修改数组
print("ArrList的个数:\(ArrList.count)")
//判断数组是否为空
if ArrList.isEmpty {
    print("ArrList is Empty")
}else {
    print("ArrList is not Empty")
}

//二、在数组后面添加
//ArrList.append("New_Obiect")
ArrList += ["new1","new2"]
//print(ArrList)//[Eggs, 123, 23.4, 1, new1, new2]

//三、修改数组集中常见的用法
//修改某个元素的值
shoppingList[1] = "true"
print(shoppingList)//["Eggs", "true"]
//可以通过数组下标批量修改数组中得值
ArrList[1...3] = ["change"]
print(ArrList)//[Eggs, change, new1, new2]

//四、结构体的基本定义

//struct name<:protoco;> {
//    var 成员名1 : 数据类型1
//    var 成员名2 : 数据类型2
//}

struct BookInfo {
    
    var Name:String = "Default"
    var Author:String = "Default"
    var subType:String = "Default"
    var time:String = "0-0-0-0"
}

var book:BookInfo
var books = BookInfo(Name: "zjh", Author: "zjh", subType: "zjh", time: "1121-10-21-1")
print(books)
//


//标签语句



//Switch

let someCharacter: Character = "h"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}


//swift不担心break的影响，要想实现c语言一样那种不受break影响，就加fallthrough
let anotherCharacter: Character = "a"
switch anotherCharacter {

case "a":
    print("The letter A")
    fallthrough//加上fallthrough就会执行下一个case
default:
    print("Not the letter A")
}


//switch语句的case中可以匹配一个数值范围
let count = 3_000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}
print("There are \(naturalCount) \(countedThings).")


//元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

//数值绑定
//在case匹配的同时，可以将switch语句中的值绑定给一个特定的常量或者变量，以便在case的语句中使用
let anotherPoint = (1, 1)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


//where
//switch语句可以使用where关键词来增加判断的条件，

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// prints "(1, -1) is on the line x == -y"




