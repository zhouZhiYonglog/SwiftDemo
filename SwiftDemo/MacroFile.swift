//
//  MacroFile.swift
//  SwiftDemo
//
//  Created by 周智勇 on 2018/11/6.
//  Copyright © 2018年 zhouzhiyong. All rights reserved.
//

import UIKit

let kUIScreenWidth = UIScreen.main.bounds.size.width
let kUIScreenHeight = UIScreen.main.bounds.size.height
let kNavigationBarHeight = (kIsIphoneX() ? 88 : 64)
let kTabBarHeight = (kIsIphoneX() ? 49 + kHomeIndicatorHeight : 49)
let kStatuBarHeight = (kIsIphoneX() ? 44 : 20)
let kHomeHeight = (kIsIphoneX() ? 34 : 0)
let kHomeIndicatorHeight = (kIsIphoneX() ? 34 : 0)

func kIsIphoneX() -> Bool {
    let bottom:CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    var isiPhone = false
    if #available(iOS 11.0, *) {
        if (bottom > 0){
            isiPhone = true
        }else{
            isiPhone = false
        }
    } else {
        isiPhone = false
    }
    return isiPhone
}

func RGBAColor(r :CGFloat ,g:CGFloat,b:CGFloat, a:CGFloat) ->UIColor{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RGBColor(r :CGFloat ,g:CGFloat,b:CGFloat) ->UIColor{
    return RGBAColor(r: r, g: g, b: b, a: 1)
}

//MARK: 网络
func kTotalBaseUrlDict() -> NSDictionary {
    let path:String = Bundle.main.path(forResource: "BaseUrl", ofType: "plist")!
    return NSDictionary.init(contentsOfFile: path)!
}

func kEnvironment() -> NSInteger {
    return kTotalBaseUrlDict().object(forKey: "AppEnvironment") as! NSInteger
}

func kCurrentUrlDict() -> NSDictionary {
    let environment:String = (kEnvironment() == 0 ? "Test" : (kEnvironment() == 1 ? "UAT" : "Formal"))
    return kTotalBaseUrlDict().object(forKey: environment) as! NSDictionary
}

func kShopMallURL() -> String {
    return kCurrentUrlDict().object(forKey: "ShopMallURL") as! String //商城
}

func kMagazineBaseURL() -> String {
    return kCurrentUrlDict().object(forKey: "MagazineBaseURL") as! String //杂志、社群
}

func kUserCenterBaseURL() -> String {
    return kCurrentUrlDict().object(forKey: "UserCenterBaseURL") as! String //登录注册、个人中心
}

func kUploadPicBaseUrl() -> String {
    return kCurrentUrlDict().object(forKey: "UploadPicBaseUrl") as! String //图片上传
}





class MacroFile: NSObject {

}
