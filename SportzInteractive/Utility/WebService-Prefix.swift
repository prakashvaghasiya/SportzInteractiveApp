//
//  WebService-Prefix.swift
//  RentalHomeUser
//
//  Created by Nikul on 15/04/20.
//  Copyright © 2019 DayDreamSoft. All rights reserved.
//

import Foundation

struct APIErrorLogConstants {
    static let NoInternet = "K2C requires a network connection to work properly.  Please check your WiFi or internet connection."
    static let SomethingWrong = "Something went wrong. Please try after some time."
    static let NoResult = "No results found!"
    static let ServerDown = "AppName server is not responding.Please try after some time"
}

struct APISuccessLogConstants {
    static let ResendOTP = "Resend OTP Successfully."
    static let BookService = "Booked service successfully."
    static let AddFeedback = "Added feedback successfully."
}


struct APIServerConstants {
    static let BaseURL = "http://vbinfotech.website/khushboo/fix_food/api.php?" // TEST
    //static let BaseURL = "http://fixfood.in/apis/fix_food/api.php?" //UTA
}

struct APIConstants {
    static let Register = "\(APIServerConstants.BaseURL)postUsermobileRegister"
    static let VERIFY_OTP = "\(APIServerConstants.BaseURL)varify_otp"
    static let UPDATE_PROFILE = "\(APIServerConstants.BaseURL)postUserProfileUpdate"
    static let GET_PROFILE = "\(APIServerConstants.BaseURL)getUserProfile"    
    static let GET_ADDRESS = "\(APIServerConstants.BaseURL)get_adderss"
    static let ADD_ADDRESS = "\(APIServerConstants.BaseURL)add_adderss"
    static let DELETE_ADDRESS = "\(APIServerConstants.BaseURL)Deleteaddress"
    static let UPDATE_ADDRESS = "\(APIServerConstants.BaseURL)Updateaddress"
    static let ADDFEEDBACK = "\(APIServerConstants.BaseURL)add_feedback"
    static let GETNOTIFICATION = "\(APIServerConstants.BaseURL)get_notification"
    static let GETPLAN = "\(APIServerConstants.BaseURL)get_plan"
    static let GETSETTINGS = "\(APIServerConstants.BaseURL)settings"
    static let GETORDER = "\(APIServerConstants.BaseURL)get_order"
    static let GETCHEF = "\(APIServerConstants.BaseURL)get_chef"
    static let GETCUISINEALL = "\(APIServerConstants.BaseURL)get_cuisine_all"
    static let GETCUISINE = "\(APIServerConstants.BaseURL)get_cuisine"
    static let GETELITE = "\(APIServerConstants.BaseURL)get_timeslot_elite"
    static let GETBASIC = "\(APIServerConstants.BaseURL)get_timeslot_basic"
    static let GETPREMIUM = "\(APIServerConstants.BaseURL)get_timeslot_premium"
    static let ADDORDER = "\(APIServerConstants.BaseURL)add_order"
    static let ADDRATING = "\(APIServerConstants.BaseURL)add_rating"
    static let STATUSMANAGEORDER = "\(APIServerConstants.BaseURL)status_manage_order"
    static let GETBANNER = "\(APIServerConstants.BaseURL)get_banner"
    static let BOOKINGPLANACTIVATED = "\(APIServerConstants.BaseURL)booking_plan_active"    
    static let SEARCHCHEF = "\(APIServerConstants.BaseURL)search_chef"
    static let FILTERCHEF = "\(APIServerConstants.BaseURL)filter_chef"
    static let BOOKINGPLANCANCLE = "\(APIServerConstants.BaseURL)booking_plan_cancel"
    static let ADDFORM = "\(APIServerConstants.BaseURL)add_form"
}
