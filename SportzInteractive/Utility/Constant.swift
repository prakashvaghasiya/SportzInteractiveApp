//
//  Constant.swift
//  mycarwashing
//
//  Created by sejal on 22/03/19.
//  Copyright © 2019 sejal. All rights reserved.
//

import UIKit


#if TARGET_IPHONE_SIMULATOR
let IsSimulator = true
let IsRealDevice = false
#else
let IsSimulator = false
let IsRealDevice = true
#endif

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let FONT_VERY_VERY_LIGHT = "GoogleSans-Regular"
let FONT_VERY_LIGHT = "GoogleSans-Regular"
let FONT_LIGHT = "GoogleSans-Regular"

let FONT_REGULER = "GoogleSans-Regular"
let FONT_MEDIUM = "GoogleSans-Medium"

let FONT_BOLD = "GoogleSans-Bold"
let FONT_VERY_BOLD = "GoogleSans-Bold"
let FONT_VERY_VERY_BOLD = "GoogleSans-Bold"

let BGColor = RGBColor(r: 245,g: 245,b: 245,a: 1.0)
let NAVColor = RGBColor(r: 0,g: 0,b: 0,a: 1.0)
let ExtraColor = RGBColor(r: 1,g: 254,b: 207,a: 1.0)
let GreenColor = RGBColor(r: 106,g: 178,b: 84,a: 1.0)

let AppName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
let isTest = true
let duumyImageURL1 = "http://lorempixel.com/\(random(min: 300, max: 500))/\(random(min: 300, max: 500))/nature/"
func duumyImageURL() -> String {
    return duumyImageURL1
}
let appid = ""//kris
let bannerAdId = ""// kri
//let bannerAdId = ""//
//let bannerAdId = ""// testing

let interstitialId_Google = ""
let rewardAd = ""
let nativeAd = ""
let placement_intestitial = ""
let placement_banner = "" //kri
//let placement_banner = "1932914603670083_1932956143665929" //sej

//let isFBAd = false
let isGoogleAd = true
let isISAd = true
let kCredit = "credit"
let defaultCredit = 15
var chefReviewCount = 0
var razorpayTestKey = ""
/*
 
 // MARK: - OUTLET
 
 // MARK: - PROPERTY
 
 // MARK: - LIFE CYCLE
 override func viewDidLoad() {
     
     super.viewDidLoad()
     
     
 }
 
 // MARK: - UI SETUP
 
 // MARK: - BUTTON CLICK
 
 // MARK: - OTHER
 
 // MARK: - DELEGATE
 
 
 */
let appWindow: UIWindow? = {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
    
    return UIApplication.shared.delegate?.window ?? nil
}()

extension UserDefaults{
    
    
    static var isLogin: Bool {
        get {
            return (UserDefaults.standard.bool(forKey: "isLogin"))
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLogin")
            UserDefaults.standard.synchronize()
        }
    }
    
    
}
    

