//
//  Double + Extension.swift
//  Caremote
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
