//
//  NFCReader.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
// Manage NFC related tasks on the device

import CoreNFC

class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {
    
    var nfcSession: NFCNDEFReaderSession?
    
    // Function to start scanning
    func startScanning(completion: @escaping (String?) -> Void) {
        // Create an NFC reader session
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        
        // Start scanning
        nfcSession?.begin()
        
        // The completion handler will be called when data is read
        self.completionHandler = completion
    }
    
    // Completion handler to return the data
    private var completionHandler: ((String?) -> Void)?
    
    // Delegate method that gets called when a tag is discovered
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Get the first message
        if let firstMessage = messages.first {
            // Convert the first record of the message to a string
            if let payload = firstMessage.records.first?.payload, let message = String(data: payload, encoding: .utf8) {
                // Return the message to the caller
                completionHandler?(message)
            }
        }
    }
    
    // Delegate method called when the session is invalidated (either success or failure)
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        // Optionally handle when the session becomes active
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error?) {
        // Handle session errors
        if let error = error {
            print("NFC session invalidated with error: \(error)")
        }
        
        // Return nil if no data was read
        completionHandler?(nil)
    }
}

