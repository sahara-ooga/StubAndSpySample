//
//  ReadableRepositoryContract.swift
//  TryStubAndSpy
//
//  Created by Yuu Ogasa on 2017/09/04.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import Foundation

protocol ReadableRepositoryContract {
    func read() -> Int      //制御したい振る舞いをProtocolにする
}

/// Protocolに準拠したクラス/本番で使用するクラス
class ReadableRepository: ReadableRepositoryContract {
    func read() -> Int {
        return UserDefaults.standard.integer(forKey: "base")
    }
}
