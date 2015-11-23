//
//  ViewController.swift
//  phoneNumber
//
//  Created by 张朝伟 on 15/11/23.
//  Copyright © 2015年 zcwlwen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var supplier: UITextField!
    @IBOutlet weak var province: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var suit: UITextField!
    
    @IBOutlet weak var outPut: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSelected(sender: AnyObject) {
        
        
        let phone = number.text
        let url = "http://apis.baidu.com/apistore/mobilephoneservice/mobilephone?tel=\(phone!)"
        Alamofire.request(.GET, url,headers: ["apikey": "26280f2483eadcccab270e7e6a174bb2"]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                        let json           = JSON(value)
                        let msn            = json["retMsg"].string
                        let supplierValue  = json["retData"]["supplier"].string
                        let provinceValue  = json["retData"]["province"].string
                        let cityValue      = json["retData"]["city"].string
                        let suitValue      = json["retData"]["suit"].string

                    if msn == "success"{
                        self.outPut.text   = msn
                        self.supplier.text = supplierValue
                        self.province.text = provinceValue
                        self.city.text     = cityValue
                        self.suit.text     = suitValue
                        
                    }
                    else{
                        
                        self.outPut.text = msn
                 
                    
                    }
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
        
       
        
    
        
        
    }

}

