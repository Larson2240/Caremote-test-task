//
//  WatchContentViewModel.swift
//  Caremote WatchKit Extension
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import Combine
import CoreMotion
import WatchKit

final class WatchContentViewModel: ObservableObject {
    private let motionManager = CMMotionManager()
    private let connectivityController = WatchConnectivityController.shared
    
    @Published var xValue: Double = 0
    @Published var yValue: Double = 0
    @Published var zValue: Double = 0
    
    func configureMotionManager() {
        guard motionManager.isAccelerometerAvailable else { return }
        
        // 60 HZ refresh rate
        motionManager.accelerometerUpdateInterval = 1 / 60
        motionManager.startAccelerometerUpdates()
        
        let timer = Timer(fire: Date(), interval: (1 / 60),
                          repeats: true, block: { [weak self] timer in
            guard
                let self = self,
                let data = self.motionManager.accelerometerData
            else {
                return
            }
            
            self.xValue = data.acceleration.x
            self.yValue = data.acceleration.y
            self.zValue = data.acceleration.z
            
            self.sendDataToPhone()
        })
        
        RunLoop.current.add(timer, forMode: .default)
    }
    
    func configureBatteryMonitoring() {
        WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
    }
    
    private func sendDataToPhone() {
        let message = ["xValue": xValue,
                       "yValue": yValue,
                       "zValue": zValue]
        
        connectivityController.send(message)
    }
    
    func batteryLevel() -> Int {
        return Int(WKInterfaceDevice.current().batteryLevel * 100)
    }
}
