//
//  Hoge.swift
//  TryStubAndSpy
//
//  Created by Yuu Ogasa on 2017/09/04.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import UIKit

class Input{
    private let repository:ReadableRepositoryContract
    
    init(repository:ReadableRepositoryContract) {
        self.repository = repository
    }
    
    //既存の実装がある場合、このメソッドを足すことで影響を減らすことが出来る
    init() {
        let repo = ReadableRepository()
        self.repository = repo
    }
    
    /// テスト対象のメソッド
    ///
    /// - Parameter int: <#int description#>
    /// - Returns: <#return value description#>
    func multiplication(int:Int) -> Int {
    //    let base = UserDefaults.standard.integer(forKey: "base")    //大域変数から取得している暗黙的入力。
        let base = self.repository.read()   //暗黙的入力の箇所では、Protocolを利用するように変更
        return base * int
    }
}
