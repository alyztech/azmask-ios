//
//
// Mask.swift
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

/// Describes one char mask
public struct Mask {
    
    /// Type of the mask chars, ``fixed`` or ``regex``
    public let maskType: MaskType
    
    /// If the ``maskType`` is ``fixed`` it returns the value it self else if is ``regex`` returns a regex validation for the input char
    public let value: String
    
    /// The index position of the validation
    public let index: Int
    
    public init(
        _ maskType: MaskType,
        value: String,
        index: Int
    ){
        self.maskType = maskType
        self.value = value
        self.index = index
    }
    
}
