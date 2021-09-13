//
//  Color.swift
//  viewCode-CollectionView
//
//  Created by Gabriel on 12/09/21.
//

import UIKit

class Color {
    var color:  UIColor
    var hex: String
    var selected: Bool
    
    init(color: UIColor, hex: String) {
        self.color = color
        self.hex = hex
        self.selected = false
    }
}
