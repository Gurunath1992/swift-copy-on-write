//
//  ViewController.swift
//  SwiftCopyOnWrite
//
//  Created by Gurunath Sripad on 4/6/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firstArray = [1,2]
        var secondArray = firstArray
        
        //both arrays have same address because of there is no write of new data
        firstArray.withUnsafeBufferPointer { (pointer) in
            print(pointer)
        }
        
        secondArray.withUnsafeBufferPointer { (pointer) in
            print(pointer)
        }
        
        firstArray.append(3)
        
        firstArray.withUnsafeBufferPointer{(pointer) in
            print("New address after write\(pointer)")
        }
        
        var firstStruct = SampleStruct(name: "John")
        var secondStruct = firstStruct
        
        self.address(pointer: &firstStruct)
        self.address(pointer: &secondStruct)
        
        var firstCOWStruct = COWrapper(SampleStruct(name: "John"))
        var seconfCOWStruct = firstCOWStruct
        
        self.address(pointer: &firstCOWStruct.ref.val)
        self.address(pointer: &seconfCOWStruct.ref.val)
    }

    
    func address(pointer: UnsafeRawPointer) {
        let address = Int(bitPattern:pointer)
        print(NSString(format:"%p",address))
    }

}

