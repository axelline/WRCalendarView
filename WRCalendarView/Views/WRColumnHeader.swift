//
//  ScheduleWeekColumnHeader.swift
//  Argos
//
//  Created by wayfinder on 2017. 4. 2..
//  Copyright © 2017년 Tong. All rights reserved.
//

import UIKit
import SwiftDate

class WRColumnHeader: UICollectionReusableView {
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weekdayLbl: UILabel!
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        dateFormatter.locale = Locale(identifier: "en_US")
        
        backgroundColor = UIColor(hexString: "f7f7f7")
        dayLbl.layer.cornerRadius = dayLbl.frame.height/2
        dayLbl.clipsToBounds = true
    }
    
    var date: Date? {
        didSet {
            if let date = date {
                let weekday = calendar.component(.weekday, from: date) - 1

                dayLbl.text = String(calendar.component(.day, from: date))
                weekdayLbl.text = dateFormatter.weekdaySymbols[weekday]
                weekdayLbl.textColor = .black
                
                if date.isInSameDayOf(date: Date()) {
                    dayLbl.textColor = .white
                    dayLbl.backgroundColor = .red
                    weekdayLbl.font = UIFont.boldSystemFont(ofSize: weekdayLbl.font.pointSize)
                } else {
                    if [0,6].contains(weekday) {
                        dayLbl.textColor = .lightGray
                        weekdayLbl.textColor = .lightGray
                    } else {
                        dayLbl.textColor = .black
                        weekdayLbl.textColor = .black
                    }
                    dayLbl.backgroundColor = .clear
                    weekdayLbl.font = UIFont.systemFont(ofSize: weekdayLbl.font.pointSize)
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLbl.text = ""
        weekdayLbl.text = ""
    }
}
