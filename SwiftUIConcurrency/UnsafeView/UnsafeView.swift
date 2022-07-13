//
//  UnsafeView.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

struct UnsafeView: View {
    @StateObject private var unsafeViewModel = UnsafeViewModel()
    
    var body: some View {
        VStack {
            Button("Fetch unsafe data") {
                Task {
                    await unsafeViewModel.fetchRowData()
                }
            }
            .padding([.top], 200)
            
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
