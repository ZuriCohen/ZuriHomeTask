//
//  Extensions.swift
//  ZuriHomeTask
//
//  Created by MacBook Pro on 3/31/19.
//  Copyright © 2019 inmanage. All rights reserved.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
