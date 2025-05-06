// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

typealias RandomElements<T> = [RandomElement<T>]

struct RandomElement<T> {
    let id: T
    let probability: Int
}
