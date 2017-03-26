//
//  Result.swift
//  Practical
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//
// Used

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error)
}
