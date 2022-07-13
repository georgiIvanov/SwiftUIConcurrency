//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by Georgi Ivanov on 13.07.22.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            SafeView()
                .tabItem {
                    Label("Safe", systemImage: "plus.app")
                }
            
            UnsafeView()
                .tabItem {
                    Label("Order", systemImage: "minus.square")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
