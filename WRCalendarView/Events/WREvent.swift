//
//  WREvent.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 29..
//
//

import UIKit

open class WREvent: NSObject {
    open var identifier: String = ""
    open var title: String = ""
    open var startDate: Date!
    open var stopDate: Date!
    open var viewColor: UIColor!
    open var textColor: UIColor!
    
    convenience public init(identifier: String, startDate: Date, stopDate: Date, title: String, viewColor: UIColor = .blue, textColor: UIColor = .white) {
        self.init()
        
        self.identifier = identifier
        self.startDate = startDate
        self.stopDate = stopDate
        self.title = title
        self.viewColor = viewColor
        self.textColor = textColor
    }
}
