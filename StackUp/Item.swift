//
//  Item.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
