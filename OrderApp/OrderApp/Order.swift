//
//  Order.swift
//  OrderApp
//
//  Created by Junne Murdock on 12/19/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
