//
//  TryStubAndSpyTests.swift
//  TryStubAndSpyTests
//
//  Created by Yuu Ogasa on 2017/09/04.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import XCTest
@testable import TryStubAndSpy

class ReadableRepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultiplication(){
        //はじめに、入力と期待される出力（比較対象）を変数で定義しておく
        let base = 6
        let int = 2
        let expected = 12
        
        //スタブを差し込む
        let repositoryStub = ReadableRepositoryStub(base: base)
        let input = Input(repository: repositoryStub)
        
        let actual = input.multiplication(int: int)
        XCTAssertEqual(actual, expected)//スタブに差し替えても、multiplicationの挙動をチェックするには十分
    }
    
}

class ReadableRepositoryStub: ReadableRepositoryContract {
    private let base:Int
    
    init(base:Int) {
        self.base = base
    }
    
    func read() -> Int {
        return self.base        //本番のオブジェクトでは、UserDefaultsから返すが、スタブではプロパティの値を直接返す
    }
}
