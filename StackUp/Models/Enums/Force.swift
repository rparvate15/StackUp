//
//  Force.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

enum Force: String, CaseIterable, Encodable, Decodable {
    case push
    case pull
    case constant
    case null
}
