//
//  WatchContentView.swift
//  Caremote WatchKit Extension
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import SwiftUI

struct WatchContentView: View {
    @StateObject private var viewModel = WatchContentViewModel()
    
    var body: some View {
        ZStack {
            Color.black
            
            content
        }
        .onAppear {
            viewModel.configureMotionManager()
            viewModel.configureBatteryMonitoring()
        }
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            Spacer()
            
            DataStack(topic: "Battery level: ",
                      value: "\(viewModel.batteryLevel())%")
            
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

struct WatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchContentView()
    }
}
