//
//  WatchConnectivityController.swift
//  Caremote
//
//  Created by Seraphim Kovalchuk on 04.08.2022.
//

import WatchConnectivity

final class WatchConnectivityController: NSObject, ObservableObject {
    static let shared = WatchConnectivityController()
    private let session = WCSession.default
    
    var receivedDataAction: (([String: Any]) -> Void)?
    
    private override init() {
        super.init()
        guard WCSession.isSupported() else { return }
        
        session.delegate = self
        session.activate()
    }
    
    func send(_ messageContent: [String: Any]) {
        guard WCSession.default.activationState == .activated else { return }
        
#if os(iOS)
        guard WCSession.default.isWatchAppInstalled else { return }
#else
        guard WCSession.default.isCompanionAppInstalled else { return }
#endif
        
        session.sendMessage(messageContent, replyHandler: nil) { error in
            print("Cannot send message: \(String(describing: error))")
        }
    }
}

extension WatchConnectivityController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("connected")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        receivedDataAction?(message)
    }
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
#endif
}
