//
//  Order.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

enum OrderType: String, Hashable {
    case buy
    case sell
}

struct Order {
    let amount: Double
    let pair: String
    let type: OrderType
}

extension Order: Identifiable {
    var id: Int {
        pair.hashValue ^ type.hashValue ^ Int(amount)
    }
}
