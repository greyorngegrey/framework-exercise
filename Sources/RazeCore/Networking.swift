//
//  Networking.swift
//  RazeCore
//
//  Created by Julio Lopez on 1/27/22.
//

import Foundation


extension RazeCore {
    public class Networking {
        
        /// Responsible for handling all network calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() {}
            
            private let session = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { data, response, error in
                    
                }
                task.resume()
            }
            
            public enum NetworkResult<Value> {
                case success(Value)
                case failure(Error?)
            }
        }
    }
}
