//
//  UIView+Ex.swift
//  YJToast
//
//  Created by 祎 on 2022/10/26.
//

import Foundation

extension UIView {
    
    static var toastListKey = "toastListKey"
    var toastList: [UIView] {
        set {
            objc_setAssociatedObject(self, &UIView.toastListKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            if newValue.count > 0 {
                isUserInteractionEnabled = false
            }else{
                isUserInteractionEnabled = true
            }
        }
        get {
            if let list = objc_getAssociatedObject(self, &UIView.toastListKey) as? [UIView] {
                return list
            }
            return []
        }
    }
}
