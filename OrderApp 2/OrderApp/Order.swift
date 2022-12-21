//
//  Order.swift
//  OrderApp
//
//  Created by Ami Smith on 12/5/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
