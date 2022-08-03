//
//
// AzMaskGroup.swift
// AzMask
//
// Created by Caio Mansho on 10/07/22
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

public class AzMaskGroup: AzMaskFormatter {

    private var azMasks: [AzMask]
    var textCache = ""

    public init(_ masks: [[Mask]]) {
        self.azMasks = masks.sorted (by: {
            $0.count < $1.count
        }).map({ masks in
            AzMask(masks)
        })
    }

    public func formatValue(_ text: String) -> String {
        if(text.isEmpty || textCache == text){
            return text
        } else {
            var cleanText = ""
            azMasks.forEach { mask in
                let formatResult = mask.formatValue(text)
                if(cleanText.count < mask.cleanTextCache.count){
                    cleanText = mask.cleanTextCache
                    textCache = formatResult
                }
            }
            return textCache
        }
    }
}
