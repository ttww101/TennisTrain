//
//  UITableView++.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func isCellVisible(indexSection: Int, indexRow: Int) -> Bool {
        
        guard let indexes = self.indexPathsForVisibleRows else {
            
            return false
            
        }
        
        return indexes.contains {$0.section == indexSection && $0.row == indexRow }
        
    }
}
