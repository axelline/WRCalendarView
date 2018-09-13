//
//  WRCurrentTimeIndicator.swift
//
//  Created by wayfinder on 2017. 4. 6..
//  Copyright © 2017년 revo. All rights reserved.
//

import UIKit

class WRCurrentTimeIndicator: UICollectionReusableView {
    @IBOutlet weak var timeLbl: UILabel!
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateFormatter.dateFormat = "HH:mm"
        
        let timer = Timer(fireAt: Date().dateByAdding(1, .minute).date, interval: TimeInterval(60), target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
        
        updateTimer()
    }
    
    @objc func updateTimer() {
        timeLbl.text = dateFormatter.string(from: Date())
    }
}
