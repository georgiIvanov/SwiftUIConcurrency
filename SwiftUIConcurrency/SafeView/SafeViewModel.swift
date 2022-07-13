//
//  SafeViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

@MainActor
class SafeViewModel: ObservableObject {
    @Published private(set) var rows : [Order] = []

    func fetchRowData() async {
        let orders = await LongRunningTask().getOrders()
        self.rows = orders
    }
}
