//
//  HelloFlynnActor.swift
//  FlynnActorModel
//
//  Created by YuCheng on 2021/2/10.
//

import Foundation
import Flynn

class HelloFlynnActor: Actor {
    private func _bePrint(_ string: String) {
        print(string)
    }
}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension HelloFlynnActor {

    @discardableResult
    public func bePrint(_ string: String) -> Self {
        unsafeSend { self._bePrint(string) }
        return self
    }

}
