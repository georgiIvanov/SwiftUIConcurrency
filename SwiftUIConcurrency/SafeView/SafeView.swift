//
//  SafeView.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

struct SafeView: View {
    
    @StateObject private var safeViewModel = SafeViewModel()
    @State private var coinFlip: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Safe fetch") {
                    Task {
                        await safeViewModel.fetchRowData()
                    }
                }
                Spacer()
                Button("Coin flip (\(coinFlip ? "True" : "False"))") {
                    Task {
                        await safeViewModel.updateSomeData($coinFlip)
                    }
                }
            }
            .padding([.top], 120)
            .padding(20)
            
            List(safeViewModel.rows) { order in
                HStack {
                    Text(order.pair)
                    Spacer()
                    Text(order.type.rawValue)
                }
            }
        }
    }
}
