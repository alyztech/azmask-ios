//
//
// AzMask.swift
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

public class AzMask: AzMaskFormatter {
    
    var textCache: String = ""
    var cleanTextCache: String = ""
    let masks: [Mask]
    
    public init(_ masks: [Mask]){
        self.masks = masks.sorted(by: { a, b in
            a.index < b.index
        })
    }
    
    func addToCache(_ result: String, cleanResult: String) -> String {
        self.textCache = result
        self.cleanTextCache = cleanResult
        return textCache
    }
    
    public func formatValue(_ text: String) -> String {
        var result = ""
        var index = text.startIndex
        var cleanResult = ""
        
        for mask in masks where index < text.endIndex {
            let currentChar = text[index]
            if mask.maskType == .regex {
                if index < textCache.endIndex && textCache[index] == currentChar {
                    result.append(currentChar)
                    cleanResult.append(currentChar)
                    index = text.index(after: index)
                } else if mask.maskType == .regex {
                    if let validatedIndex = validateRegex(text, mask: mask, index: index) {
                        result.append(text[validatedIndex])
                        cleanResult.append(text[validatedIndex])
                        index = text.index(after: validatedIndex)
                    } else {
                        return addToCache(result, cleanResult: cleanResult)
                    }
                }
            } else {
                if String(currentChar) == mask.value {
                    let lastTextIndex = text.index(after: index)
                    if lastTextIndex == text.endIndex {
                        let _ = result.dropLast()
                        return addToCache(result, cleanResult: cleanResult)
                    } else {
                        index = text.index(after: index)
                    }
                }
                result.append(mask.value)
                
            }
        }
        return addToCache(result, cleanResult: cleanResult)
    }
    
    private func validateRegex(_ text: String, mask: Mask, index: String.Index) -> String.Index? {
        let char = String(text[index])
        let range = char.startIndex..<char.endIndex
        if let match = char.range(of: mask.value, options: .regularExpression), range == match {
            return index
        } else {
            let newIndex = text.index(after: index)
            if newIndex < text.endIndex {
                return validateRegex(text, mask: mask, index: newIndex)
            } else {
                return nil
            }
        }
    }
    
}
