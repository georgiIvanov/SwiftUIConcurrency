//
//  LongRunningTask.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import Foundation

class LongRunningTask {
    func getOrders() async -> [Order] {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        return [
            Order(pair: "USD/BTC", type: .buy),
            Order(pair: "ETH/USDT", type: .buy),
            Order(pair: "SOL/APE", type: .sell),
            Order(pair: "ETH/BTC", type: .buy),
        ]
    }
}
