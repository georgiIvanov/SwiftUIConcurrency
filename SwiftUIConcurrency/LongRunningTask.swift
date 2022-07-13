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
        return generateOrders()
    }
    
    
    func generateOrders() -> [Order] {
        return (0...Int.random(in: 1...10))
            .map { amount in
                Order(
                    amount: Double(amount),
                    pair: "\(getRandomCurrency()) / \(getRandomCurrency())",
                    type: amount % 2 == 0 ? .buy : .sell
                )
            }
    }
    
    func getRandomCurrency() -> String {
        let index = Int.random(in: 0...9)
        let arr = [
            "USD",
            "ADA",
            "BTC",
            "ETH",
            "DOGE",
            "SHIB",
            "APE",
            "ONE",
            "USDC",
            "USDT"
        ]
        return arr[index]
    }
}
