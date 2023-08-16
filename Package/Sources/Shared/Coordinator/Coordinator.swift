//
//  Coordinator.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Foundation

/// 画面遷移を管理する Coordinator に準拠させる基本となる Protocol.
public protocol Coordinator: AnyObject {
    /// 画面遷移を開始する.
    func start()
}
