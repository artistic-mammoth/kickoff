//
//  RandomElement.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

typealias RandomElements<T> = [RandomElement<T>]

struct RandomElement<T> {
    let id: T
    let weight: Int
}
