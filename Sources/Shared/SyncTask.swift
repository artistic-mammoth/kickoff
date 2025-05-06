// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

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
