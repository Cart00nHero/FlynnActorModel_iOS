//
//  DataStorageActor.swift
//  FlynnActorModel
//
//  Created by YuCheng on 2021/2/11.
//

import Foundation
import Flynn

protocol ConcurrentDatastoreRetrievable {
    @discardableResult
    func beRetrieveValue(_ key: String, _ value: Any?) -> Self
}

class ConcurrentDatastore: Actor {
    private var storage: [String: Any?] = [:]

    private func _beGet(_ key: String, _ sender: ConcurrentDatastoreRetrievable) {
        if let value = storage[key] {
            sender.beRetrieveValue(key, value)
        }
    }

    private func _beGet(_ key: String, _ sender: Actor, _ block: @escaping (Any?) -> Void) {
        if let value = storage[key] {
            // This unsafeSend is critical. If we just call the closure directly, then
            // it will execute on the ConcurrentDatastore Actor's "thread" and it could
            // lead to the sending actor running on two threads at the same time. By
            // calling unsafeSend, the closure executes as if it were a behavior, so the
            // closure will execute safely on the sending actor.
            sender.unsafeSend {
                block(value)
            }
        }
    }

    private func _beSet(_ key: String, _ value: Any?) {
        storage[key] = value
    }

}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension ConcurrentDatastore {

    @discardableResult
    public func beGet(_ key: String, _ sender: ConcurrentDatastoreRetrievable) -> Self {
        unsafeSend { self._beGet(key, sender) }
        return self
    }
    @discardableResult
    public func beGet(_ key: String, _ sender: Actor, _ block: @escaping (Any?) -> Void) -> Self {
        unsafeSend { self._beGet(key, sender, block) }
        return self
    }
    @discardableResult
    public func beSet(_ key: String, _ value: Any?) -> Self {
        unsafeSend { self._beSet(key, value) }
        return self
    }

}
