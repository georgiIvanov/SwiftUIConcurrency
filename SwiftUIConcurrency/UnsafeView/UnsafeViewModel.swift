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
        let orders = await BackgroundTask().getOrders()
        self.rows = orders
    }
    
    /// Updates view state from a background thread.
    /// This time `UnsafeViewModel` is not the owner,
    /// but it still mutates state from the background.
    /// Unfortunately we don't get a warning when doing this.
    func updateSomeData(_ binding: Binding<Bool>) async {
        let data = await BackgroundTask().flipCoin(value: binding.wrappedValue)
        print("Coin state updated on main thread: \(Thread.isMainThread)")
        binding.wrappedValue = data
    }
}
