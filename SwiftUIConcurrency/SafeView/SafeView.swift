//
//  SafeView.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

struct SafeView: View {
    
    @StateObject private var safeViewModel = SafeViewModel()
    
    var body: some View {
        VStack {
            Button("Fetch data") {
                Task {
                    await safeViewModel.fetchRowData()
                }
            }
            .padding([.top], 120)
            
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
