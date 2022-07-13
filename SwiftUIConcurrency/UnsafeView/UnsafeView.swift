//
//  UnsafeView.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

struct UnsafeView: View {
    @StateObject private var unsafeViewModel = UnsafeViewModel()
    @State private var coinFlip: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Fetch unsafe data") {
                    Task {
                        await unsafeViewModel.fetchRowData()
                    }
                }
                Spacer()
                Button("Coin flip (\(coinFlip ? "True" : "False"))") {
                    Task {
                        await unsafeViewModel.updateSomeData($coinFlip)
                    }
                }
            }
            .padding([.top], 120)
            .padding(20)
            
            List(unsafeViewModel.rows) { order in
                HStack {
                    Text(order.pair)
                    Spacer()
                    Text(order.type.rawValue)
                }
            }
        }
    }
}
