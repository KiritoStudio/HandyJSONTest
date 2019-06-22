//
//  ViewController.swift
//  Test42
//
//  Created by kirito on 6/22/19.
//  Copyright © 2019 kirito. All rights reserved.
//

import UIKit
import HandyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sendRequest(a: Login_Entity.self)
    }

    func sendRequest<T: HandyJSON>(a: T.Type) {
        
        let jsonString = " {\"code\":1,\"entity\":{\"access_token\":\"eyJhbGciOiJIUzI\",\"expires_in\":14400000.0}}";
        let tt1 = a.deserialize(from: jsonString, designatedPath: "entity")
        let tt2 = Login_Entity.deserialize(from: jsonString, designatedPath: "entity")
        
        var login = T()
        let tt3 = JSONDeserializer.update(object: &login, from: jsonString, designatedPath: "entity")
        let tt4 = T.deserialize(from: jsonString, designatedPath: "entity")
        
        let tt5 = JSONDeserializer<T>.deserializeFrom(json: jsonString, designatedPath: "entity")
        
        print("")
    }

}

