//
//  UnsafeViewModel.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import Foundation
import SwiftUI

/// A view model that's unsafe to use (no `@MainActor` annotation)
///
/// - Important: Note how changing the rows property from a background thread creates a warning in Xcode.
///
class UnsafeViewModel: ObservableObject {
    @Published private(set) var rows : [Order] = []

    /// Simulates fetching of remote data and updates state
    /// Due to scheduling state changes on a background thread we get a warning.
    func fetchRowData() async {
        let orders = await LongRunningTask().getOrders()
        self.rows = orders
    }
    
    /// Similar case - this time `UnsafeViewModel` is not the owner,
    /// but it still mutates state from the background.
    /// Unfortunately we don't get a warning when doing this.
    func updateSomeData(_ binding: Binding<Bool>) async {
        let data = await LongRunningTask().flipCoin(value: binding.wrappedValue)
        binding.wrappedValue = data
    }
}
