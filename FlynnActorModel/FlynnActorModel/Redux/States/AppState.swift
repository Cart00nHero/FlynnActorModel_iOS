//
//  AppState.swift
//  Beckon
//
//  Created by YuCheng on 2019/4/5.
//  Copyright © 2019 YuCheng. All rights reserved.
//

import ReSwift

struct AppState : StateType {
    let sceneState: SceneState
}

// MARK: - SubStates
struct SceneState : StateType {
    let currentAction : Action?
}
