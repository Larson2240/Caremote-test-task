//
//  AppContentViewModel.swift
//  Caremote
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import Combine
import Foundation

final class AppContentViewModel: ObservableObject {
    private let connectivityController = WatchConnectivityController.shared
    
    @Published var xValue: Double = 0
    @Published var yValue: Double = 0
    @Published var zValue: Double = 0
    
    func syncData() {
        connectivityController.receivedDataAction = { [weak self] message in
            DispatchQueue.main.sync {
                guard let self = self else { return }
                
                if let xValue = message["xValue"] as? Double {
                    self.xValue = xValue
                }
                
                if let yValue = message["yValue"] as? Double {
                    self.yValue = yValue
                }
                
                if let zValue = message["zValue"] as? Double {
                    self.zValue = zValue
                }
            }
        }
    }
}
