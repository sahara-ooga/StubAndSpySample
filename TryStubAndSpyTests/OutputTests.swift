//
//  WritableRepositoryTests.swift
//  TryStubAndSpy
//
//  Created by Yuu Ogasa on 2017/09/04.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import XCTest
@testable import TryStubAndSpy

class OutputTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWrite() {
        let int = 2
        
        let spy = WritableRepositorySpy()
        let output = Output(repository: spy)
        
        output.write(int: int)  //spyに値が保存されている
        XCTAssertEqual(int, spy.callArguments.first!)
    }
    
}

class WritableRepositorySpy:WritableRepositoryContract {
    private(set) var callArguments:[Int] = []
    
    /// プロトコル準拠
    ///
    /// - Parameter int: 保存する引数
    func write(int:Int) {
        self.record(int)
    }
    
    /// 呼び出しを記録する
    ///
    /// - Parameter args: writeメソッドを呼び出したときの引数
    private func record(_ args:Int){
        self.callArguments += [args]
    }
}
