//
//  AppContentView.swift
//  Caremote
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import SwiftUI

struct AppContentView: View {
    @StateObject private var viewModel = AppContentViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            content
        }
        .onAppear {
            viewModel.syncData()
        }
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            Spacer()
            
            DataStack(topic: "X Value:",
                      value: String(format: "%.2f", viewModel.xValue))
            
            DataStack(topic: "Y Value:",
                      value: String(format: "%.2f", viewModel.yValue))
            
            DataStack(topic: "Z Value:",
                      value: String(format: "%.2f", viewModel.zValue))
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppContentView()
    }
}
