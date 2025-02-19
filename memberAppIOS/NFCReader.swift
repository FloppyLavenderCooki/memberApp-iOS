//
//  NFCReader.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import CoreNFC

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    private var session: NFCNDEFReaderSession?
    
    func startScanning() { // start
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.alertMessage = "Hold your device near your card."
        session?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) { // invalidate
        // Handle errors or session invalidation here.
        print("NFC Session invalidated: \(error.localizedDescription)")
    }
    
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) { // payload
        for message in messages {
            for record in message.records {
                if let payloadText = String(data: record.payload, encoding: .utf8) {
                    DispatchQueue.main.async {
                        var cardResult = payloadText
                        
                        // getdata method NFC
                    }
                }
            }
            
        }
    }
}
