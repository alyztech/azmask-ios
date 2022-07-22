//
//
// AzMaskTests.swift
// AzMaskTests
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


import XCTest
@testable import AzMask

class AzMaskTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAzMask() throws {
        let numberFactory = MaskFactory.getMaskFactory(.number)
        let masks = [
            numberFactory.createMask(0),
            numberFactory.createMask(1),
            numberFactory.createMask(2),
            Mask(.fixed, value: ".", index: 3),
            numberFactory.createMask(4),
            numberFactory.createMask(5),
            numberFactory.createMask(6),
            Mask(.fixed, value: ".", index: 7),
            numberFactory.createMask(8),
            numberFactory.createMask(9),
            numberFactory.createMask(10),
            Mask(.fixed, value: "-", index: 11),
            numberFactory.createMask(12),
            numberFactory.createMask(13)
        ]
        
        let azMask = AzMask(masks)
        let formattedValue = azMask.formatValue("a71177638011")
        
        XCTAssertEqual(formattedValue, "711.776.380-11")
        
    }
    
    func testAzMaskGroup() throws {
        let numberFactory = MaskFactory.getMaskFactory(.number)
        let cpfMasks = [
            numberFactory.createMask(0),
            numberFactory.createMask(1),
            numberFactory.createMask(2),
            Mask(.fixed, value: ".", index: 3),
            numberFactory.createMask(4),
            numberFactory.createMask(5),
            numberFactory.createMask(6),
            Mask(.fixed, value: ".", index: 7),
            numberFactory.createMask(8),
            numberFactory.createMask(9),
            numberFactory.createMask(10),
            Mask(.fixed, value: "-", index: 11),
            numberFactory.createMask(12),
            numberFactory.createMask(13)
        ]
        
        let azCpfMask = AzMask(cpfMasks)
        
        let cnpjMasks = [
            numberFactory.createMask(0),
            numberFactory.createMask(1),
            Mask(.fixed, value: ".", index: 2),
            numberFactory.createMask(3),
            numberFactory.createMask(4),
            numberFactory.createMask(5),
            Mask(.fixed, value: ".", index: 6),
            numberFactory.createMask(7),
            numberFactory.createMask(8),
            numberFactory.createMask(9),
            Mask(.fixed, value: "/", index: 10),
            numberFactory.createMask(11),
            numberFactory.createMask(12),
            numberFactory.createMask(13),
            numberFactory.createMask(14),
            Mask(.fixed, value: "-", index: 15),
            numberFactory.createMask(16),
            numberFactory.createMask(17)
        ]
        
        let azCnpjMask = AzMask(cnpjMasks)
        
        let azMaskGroup = AzMaskGroup([azCpfMask, azCnpjMask])
        
        var formattedValue = azMaskGroup.formatValue("a71177638011")
        
        XCTAssertEqual(formattedValue, "711.776.380-11")

        formattedValue = azMaskGroup.formatValue("07.442.741/0001-71")
        
        XCTAssertEqual(formattedValue, "07.442.741/0001-71")
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
