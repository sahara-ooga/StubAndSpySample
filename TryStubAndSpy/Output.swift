//
//  Output.swift
//  TryStubAndSpy
//
//  Created by Yuu Ogasa on 2017/09/04.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import Foundation

struct Output{
    //暗黙的出力はプロトコル準拠のプライベートなプロパティに任せる
    private let repository:WritableRepositoryContract
    
    init(repository:WritableRepositoryContract) {
        self.repository = repository
    }
    
    init() {
        self.repository = WritableRepository()
    }
    
    func write(int:Int) {
        //大域変数に記録している
        //テスト時は別の場所に記録したい
    //    UserDefaults.standard.set(int, forKey: "write")
        self.repository.write(int: int)
    }
}


protocol WritableRepositoryContract {
    //テスト対象にしたい振る舞いをProtocolにする
    func write(int:Int)
}

/// 本番で使うためのstruct
struct WritableRepository:WritableRepositoryContract {
    func write(int:Int) {
        UserDefaults.standard.set(int, forKey: "write")
    }
}
