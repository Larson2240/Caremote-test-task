//
//  ContentView.swift
//  Caremote WatchKit Extension
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Color.black
            
            content
        }
        .onAppear {
            viewModel.configureMotionManager()
        }
    }
    
    private var content: some View {
        VStack(spacing: 15) {
            Spacer()
            
            xValueStack
            
            yValueStack
            
            zValueStack
            
            Spacer()
        }
    }
    
    private var xValueStack: some View {
        HStack {
            Text("X Value:")
            
            Text(String(format: "%.2f", viewModel.xValue))
                .font(.system(size: 17, weight: .bold))
                .frame(width: 50)
        }
    }
    
    private var yValueStack: some View {
        HStack {
            Text("Y Value:")
            
            Text(String(format: "%.2f", viewModel.yValue))
                .font(.system(size: 17, weight: .bold))
                .frame(width: 50)
        }
    }
    
    private var zValueStack: some View {
        HStack {
            Text("Z Value:")
            
            Text(String(format: "%.2f", viewModel.zValue))
                .font(.system(size: 17, weight: .bold))
                .frame(width: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
