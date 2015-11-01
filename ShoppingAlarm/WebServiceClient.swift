//
//  WebServiceClient.swift
//  ShoppingAlarm
//
//  Created by Sunil Kumar on 19/05/2015.
//  Copyright (c) 2015 Sunil Kumar. All rights reserved.
//

import Foundation

class WebServiceClient: NSObject {

    var test = Constant.API_KEY
    static func placesAroundLocation()
    {
        var url = NSURL(string: Constant.GOOGLE_PLACES_URL)
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(NSURLRequest(URL: url!), completionHandler:
            { (data, request, error) -> Void in
            if(error != nil)
            {
                print("Error is:\(error)")
            }
            else
            {
                var result = NSString(data: data!, encoding: NSASCIIStringEncoding)
                print("Result is :\(result!)")
                

            }
           
        })
         task.resume()
    }
    
}
