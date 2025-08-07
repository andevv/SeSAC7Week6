//
//  UIViewController+Extension.swift
//  SeSAC7Week6
//
//  Created by andev on 8/7/25.
//

import UIKit

extension UIViewController {
    
    //타입 파라미터 -> 타입 제약(클래스 제약)
    //제네릭을 활용한 경우, 선언된 함수에서는 어떤 타입이 들어올 지 알 수 없고,
    //직접 실행하거나 활용할 때 타입이 나중에 들어오게 됨
    func setCornerRadius<T: UIView>(a: T) {
        a.layer.cornerRadius = 10
        a.clipsToBounds = true
    }
    
    func total<Jack: Numeric>(a: Jack, b: Jack) -> Jack {
        print(b)
        return a
    }
    
//    func total(a: Int, b: Int) -> Int {
//        return a + b
//    }
//    
//    func total(a: Double, b: Double) -> Double {
//        return a + b
//    }
//    
//    func total(a: Float, b: Float) -> Float {
//        return a + b
//    }
}
