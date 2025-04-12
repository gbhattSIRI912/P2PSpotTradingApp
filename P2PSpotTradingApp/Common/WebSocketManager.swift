//
//  WebSocketManager.swift
//  P2PSpotTradingApp
//
//  Created by orange on 03/02/25.
//

import Foundation
import Combine
import SocketIO

class WebSocketManager {
    static let shared = WebSocketManager()
    private var socket: SocketIOClient!
    private let manager: SocketManager!
    
    // A dictionary to store event handlers
    private var eventHandlers: [String: [(SocketIOClient, [Any]) -> Void]] = [:]
    
    private init() {
        let url = URL(string: "https://your-socket-server-url.com")!
        
        // Initialize the SocketManager with a config (correct approach)
        self.manager = SocketManager(socketURL: url, config: [.log(true), .compress, .reconnects(true)])
        
        // Create the socket client using manager.socket(forNamespace:)
        self.socket = manager.defaultSocket
    }
    
    // Method to connect the socket
    func connect() {
        socket.connect()
    }
    
    // Method to disconnect the socket
    func disconnect() {
        socket.disconnect()
    }
    
    // Method to listen for different events
    func on<T>(event: String, handler: @escaping (T) -> Void) {
        socket.on(event) { data, ack in
            if let first = data.first as? T {
                handler(first)
            }
        }
    }
    
    // Method to emit messages to the server
    func emit<T>(event: String, data: T) {
        socket.emit(event, data as! SocketData)
    }
    
    // Corrected method to listen for a generic event with a proper callback signature
    func listenForEvent(event: String, handler: @escaping (Array<Any>, SocketAckEmitter) -> Void) {
        socket.on(event, callback: handler)
    }
    
    // Method to send data (can be any type, like dictionaries or arrays)
    func sendData(event: String, data: Any) {
        if let socketData = data as? SocketData {
            socket.emit(event, socketData)
        } else {
            print("Error: Data does not conform to SocketData")
        }
    }

}
