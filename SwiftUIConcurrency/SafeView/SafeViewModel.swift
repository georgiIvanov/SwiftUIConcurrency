//
//  SafeViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI


/// A view model that will safely schedule it's updates on the main actor
@MainActor
class SafeViewModel: ObservableObject {
    @Published private(set) var rows : [Order] = []

    /// Simulates fetching of remote data and updates state.
    /// Because this VM updates it's state only on the main actor via `@MainActor` annotation.
    func fetchRowData() async {
        let orders = await LongRunningTask().getOrders()
        self.rows = orders
    }
}
