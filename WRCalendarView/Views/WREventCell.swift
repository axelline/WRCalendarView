//
//  WREventCell.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 30..
//
//

import UIKit

class WREventCell: UICollectionViewCell {
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var viewColor: UIColor! = .blue
    private var textColor: UIColor! = .white

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
    }

    override var isSelected: Bool {
        didSet {
            if isSelected && isSelected != oldValue {
                UIView.animate(withDuration: TimeInterval(0.2), animations: { [unowned self] in
                    self.transform = CGAffineTransform.init(scaleX: 1.025, y: 1.025)
                    self.layer.shadowOpacity = 0.2
                }, completion: { [unowned self] _ in
                    self.transform = CGAffineTransform.identity
                })
            } else if isSelected {
                layer.shadowOpacity = 0.2
            } else {
                layer.shadowOpacity = 0.0
            }
            updateColors()
        }
    }
    
    var event: WREvent? {
        didSet {
            if let event = event {
                titleLabel.text = event.title
                viewColor = event.viewColor
                textColor = event.textColor
            }
            
            updateColors()
        }
    }
    
    func updateColors() {
        contentView.backgroundColor = backgroundColorHighlighted(isSelected)
        borderView.backgroundColor = borderColor()
        titleLabel.textColor = textColorHighlighted(isSelected)
    }
    
    func backgroundColorHighlighted(_ selected: Bool) -> UIColor {
        return selected ? viewColor : viewColor.withAlphaComponent(0.1)
    }
    
    func textColorHighlighted(_ selected: Bool) -> UIColor {
        return selected ? textColor : .black
    }
    
    func borderColor() -> UIColor {
        return self.backgroundColorHighlighted(false).withAlphaComponent(1.0)
    }
}
