//
//  YJToast.swift
//  YJToast
//
//  Created by 祎 on 2022/10/26.
//

import Foundation


public struct YJToast {
    
    let targetView: UIView
}

extension YJToast {
    
    public func showMessage(content: String?, position: ToastPosition = .centerOffset(0), retainTime: TimeInterval = 2) {
        show(content: ToastMessageContent(message: content),position: position,retainTime: retainTime)
    }
    
    public func show(content: ToastContentType, position: ToastPosition = .centerOffset(0), retainTime: TimeInterval = 2) {

        targetView.addSubview(content.contentView)
        targetView.toastList.append(content.contentView)
        switch position {
        case .topOffset(let offset):
            content.contentView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(offset)
                make.height.lessThanOrEqualToSuperview().offset(-20)
                make.width.lessThanOrEqualToSuperview().offset(-20)
            }
        case .centerOffset(let offset):
            content.contentView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(offset)
                make.height.lessThanOrEqualToSuperview().offset(-20)
                make.width.lessThanOrEqualToSuperview().offset(-20)
            }
        case .bottomOffset(let offset):
            content.contentView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(offset)
                make.height.lessThanOrEqualToSuperview().offset(-20)
                make.width.lessThanOrEqualToSuperview().offset(-20)
            }
        }
        
        
        
        if retainTime > 0.0 {
            let contentView = content.contentView
            DispatchQueue.main.asyncAfter(deadline: .now() + retainTime)
            { [weak contentView, weak targetView] in
                guard let targetView = targetView else { return }
                guard let view = contentView else { return }
                view.removeFromSuperview()
                targetView.toastList.removeAll { tmp in
                    return tmp == view
                }
            }
        }
    }
    
    
    public func hide() {
        if let contentView = targetView.toastList.popLast() {
            contentView.removeFromSuperview()
        }
    }
    
    
    public func hideAll() {
        targetView.toastList.forEach { toast in
            toast.removeFromSuperview()
        }
        targetView.toastList = []
    }
    
}



