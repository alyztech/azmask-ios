//
//
// MaskFactory.swift
// AzMask
//
// Created by Caio Mansho on 23/06/22
// Copyright © 2022 Caio Mansho. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

/// Creates ``Mask`` instances by ``MaskFactoryType``
public protocol MaskCreator {
    
    
    /// Abstracts the creation of a ``Mask``.
    ///
    /// - Parameters : index: position of the string.
    /// - Returns: created ``Mask``.
    func createMask(_ index: Int) -> Mask
    
}

public struct MaskFactory {
    
    /// Get ``MaskdFactory``  implementation by ``MaskFactoryType``
    ///
    /// - Parameters: maskFactoryType:  with the type of the ``Mask`` to be created
    /// - Returns: ``MaskFactory`` implementation of the ``Mask`` creation
    public static func getMaskFactory(_ maskFactoryType: MaskFactoryType) -> MaskCreator {
        switch maskFactoryType {
        case .letter: return LetterMaskFactory()
        case .number: return NumberMaskFactory()
        case .alphanumeric: return AlphanumericMaskFactory()
        }
    }
    
}

/// Describes a MaskFactory type.
public enum MaskFactoryType {
    case letter
    case number
    case alphanumeric
}

/// Implementation class that creates char only mask mask.
public class LetterMaskFactory: MaskCreator {
    public func createMask(_ index: Int) -> Mask {
        return Mask(.regex, value: "^[a-zA-Z]+$", index: index)
    }
    
}

/// Implementation class that creates numbers only mask.
public class NumberMaskFactory: MaskCreator {
    
    public func createMask(_ index: Int) -> Mask {
        return Mask(.regex, value: "^[0-9]*$", index: index)
    }
    
}

/// Implementation class that creates alphanumeric mask.
public class AlphanumericMaskFactory: MaskCreator {
    
    public func createMask(_ index: Int) -> Mask {
        return Mask(.regex, value: "^[a-zA-Z0-9]*$", index: index)
    }
    
}
