//
//  Network.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/22/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import Foundation
import Alamofire

let _SUCCESS = "SUCCESS"
let _FAILURE = "FAILURE"
let _status = "status"
let _data = "data"
let _error = "error"
let _code = "code"
let _message = "message"

let _HOST = "https://smartlogistic.info/api/"

class Network : NSObject {
    
    static func request(
        method: HTTPMethod,
        api: String,
        params: [String : AnyObject]?,
        success: @escaping (AnyObject) -> Void,
        failure: @escaping (String) -> Void
    ) {
        print("\(method) \(api)")
        print(params as Any)
        
        let sid = Helper.getSid()
        let headers = [
            "Cookie": "_sid="+sid,
            "Accept": "application/json",
            "Content-Type": "application/json",
//            "Accept-Encoding": "gzip,deflate" // TODO: enable gzip
            "Accept-Encoding": "gzip;q=0,deflate,sdch"
        ]
        
        Alamofire.request(_HOST+api, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
//                print("\(method) \((response.request?.URLString)!)")                
//                print(response.request?.allHTTPHeaderFields)
//                print(response.response)
//                let headers = response.response?.allHeaderFields as! [String: String]
//                print(response.data)
//                print(response.result)

                switch response.result {
                case .success(let value):
                    let result: [String: AnyObject] = value as! [String : AnyObject]
                    print("result: \(result)")

                    let status: String = result[_status] as! String
                    switch status {
                    case _SUCCESS:
                        let data = result[_data]
//                        print("data: \(data)")
                        success(data!)
                    case _FAILURE:
                        let error = result[_error] as! [String : AnyObject]
//                        let code = error[_code] as! Int
                        let message = error[_message] as! String
//                        print("error[\(code)]: \(message)")
                        failure(message)
                    default:
                        failure("")
                    }
                    
                case .failure(let error):
                    print(error)
                    failure("")
                }
        }
    }
    
    
    /*** User API ***/
    
    static func getUser(_ id: String, success: @escaping (UserModel) -> Void, failure: @escaping (String) -> Void) {
        let api = "user/"+id
        Network.request(method: .get, api: api, params: nil, success: { data in
            let user = UserModel(user: data)
            success(user)
        }, failure: { error in
            failure(error);
        });
    }
    
    static func signup(_ params: [String: AnyObject], success: @escaping (UserModel) -> Void, failure: @escaping (String) -> Void) {
        let api = "user/signup"
        Network.request(method: .post, api: api, params: params, success: { data in
            let user = UserModel(user: data)
            Helper.signin(user)
            success(user)
        }, failure: { error in
            failure(error);
        });
    }
    
    static func signin(_ params: [String: AnyObject], success: @escaping (UserModel) -> Void, failure: @escaping (String) -> Void) {
        let api = "user/signin"
        Network.request(method: .post, api: api, params: params, success: { data in
            let user = UserModel(user: data)
            Helper.signin(user)
            success(user)
        }, failure: { error in
            failure(error);
        });
    }
    
    static func signout(_ success: @escaping (AnyObject) -> Void, failure: @escaping (String) -> Void) {
        let api = "user/signout"
        Network.request(method: .post, api: api, params: nil, success: { data in
            Helper.signout()
            success(data)
        }, failure: { error in
            failure(error);
        });
    }
    
}
