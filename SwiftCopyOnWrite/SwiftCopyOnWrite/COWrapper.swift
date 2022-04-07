//
//  COWrapper.swift
//  SwiftCopyOnWrite
//
//  Created by Gurunath Sripad on 4/6/22.
//

import Foundation

final class Ref<T> {
    var val: T
    
    init(_ value:T) {
        self.val = value
    }
}

struct COWrapper<T> {
    var ref:Ref<T>
    init(_ value:T) {
        self.ref = Ref(value)
    }
    
    var value: T {
        get {
            return ref.val
        }
        set {
            if !isKnownUniquelyReferenced(&ref) {
                ref = Ref(newValue)
                return
            }
            ref.val = newValue
        }
    }
    
}
