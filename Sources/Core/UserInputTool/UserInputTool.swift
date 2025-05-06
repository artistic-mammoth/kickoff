// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

protocol IUserInputTool {
    func read() throws -> String
    func read(quote: String?) throws -> String
    func read(quote: String?, `default`: String?) throws -> String
}

extension IUserInputTool {
    func read(quote: String? = nil, `default`: String?) throws -> String {
        try self.read(quote: quote, default: `default`)
    }
}

struct UserInputTool { }

extension UserInputTool: IUserInputTool {
    func read() throws -> String {
        let input = readLine()
        
        guard let input else {
            throw KickOffError.any
        }
        
        return input
    }
    
    func read(quote: String?) throws -> String {
        if let quote {
            print(quote)
        }
        
        return try self.read()
    }
    
    func read(quote: String?, `default`: String?) throws -> String {
        if let `default`, !`default`.isEmpty {
            return `default`
        } else {
            return try read(quote: quote)
        }
    }
}
