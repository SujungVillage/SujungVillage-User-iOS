//
//  DynamicHeightTableView.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/12/25.
//

import UIKit

class DynamicHeightTableView: UITableView {
    var isDynamicSizeRequired = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != self.intrinsicContentSize {
            if self.intrinsicContentSize.height > frame.size.height {
                self.invalidateIntrinsicContentSize()
            }
        }
        
        if isDynamicSizeRequired {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
}
