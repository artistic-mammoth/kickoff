//
//  SyncTask.swift
//  kickoff
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation

struct SyncTask<T: Sendable> {
    let result: T?
    
    @discardableResult
    init(_ operation: @escaping @Sendable () async -> T) {
        let semaphore = DispatchSemaphore(value: 0)
        var value: T? = nil
        
        Task {
            value = await operation()
            semaphore.signal()
        }
        
        semaphore.wait()
        self.result = value
    }
}
