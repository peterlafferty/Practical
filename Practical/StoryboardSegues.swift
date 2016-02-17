//
//  StoryboardSegues.swift
//  Practical
//
//  Created by Peter Lafferty on 17/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import UIKit

// MARK: Storyboard segues

enum StoryboardSegue: String {
    case ShowProperty
}

func ==(lhs: UIStoryboardSegue, rhs: StoryboardSegue) -> Bool {
    return lhs.identifier == rhs.rawValue
}

func ==(lhs: StoryboardSegue, rhs: UIStoryboardSegue) -> Bool {
    return lhs.rawValue == rhs.identifier
}