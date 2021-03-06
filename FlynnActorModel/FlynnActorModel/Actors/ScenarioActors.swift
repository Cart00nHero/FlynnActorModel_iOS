//
//  ScenarioActors.swift
//  FlynnActorModel
//
//  Created by YuCheng on 2021/2/10.
//

import Foundation
import Flynn

class Scenario1: Actor,ConcurrentDatastoreRetrievable {
    private let monsters: ConcurrentDatastore

    init(_ monsters: ConcurrentDatastore) {
        self.monsters = monsters
        super.init()
    }

    private func _beRetrieveValue(_ key: String, _ value: Any?) {
        if let value = value {
            print("\(value)")
        }
    }

    private func _bePrint(_ name: String) {
        // retrieves value from storage using protocol and a callback actor
        // who adheres to a protocol defining the behavior to callback on
        monsters.beGet(name, self)
    }
}

class Scenario2: Actor {
    private let monsters: ConcurrentDatastore

    init(_ monsters: ConcurrentDatastore) {
        self.monsters = monsters
        super.init()
    }

    private func _bePrint(_ name: String) {
        // retrieves value from storage using protocol and closure. It is
        // important that ConcurrentDatastore is implemented to correctly
        // wrap the closure in unsafeSend {} to ensure it executes on
        // Scenario2 in a concurrency safe manner
        monsters.beGet(name, self) { value in
            if let value = value {
                print("\(value)")
            }
        }
    }

}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension Scenario2 {

    @discardableResult
    public func bePrint(_ name: String) -> Self {
        unsafeSend { self._bePrint(name) }
        return self
    }

}

extension Scenario1 {

    @discardableResult
    public func beRetrieveValue(_ key: String, _ value: Any?) -> Self {
        unsafeSend { self._beRetrieveValue(key, value) }
        return self
    }
    @discardableResult
    public func bePrint(_ name: String) -> Self {
        unsafeSend { self._bePrint(name) }
        return self
    }

}
