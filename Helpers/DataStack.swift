//
//  DataStack.swift
//  Caremote
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import SwiftUI

struct DataStack: View {
    var topic: String
    var value: String
    
    var body: some View {
        HStack {
            Text(topic)
            
            Text(value)
                .font(.system(size: 17, weight: .bold))
                .frame(width: 50)
        }
        .foregroundColor(.white)
    }
}

struct DataStack_Previews: PreviewProvider {
    static var previews: some View {
        DataStack(topic: "Random stuff:", value: "20")
            .previewLayout(.sizeThatFits)
    }
}
