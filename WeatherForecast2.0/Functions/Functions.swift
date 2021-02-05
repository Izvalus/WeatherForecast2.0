//
//  Functions.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 25.01.2021.
//

func setup<Type>(_ object: Type, block: (Type) -> Void) -> Type {
    block(object)
    return object
}
