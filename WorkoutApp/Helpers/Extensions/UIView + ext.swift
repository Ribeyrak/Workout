//
//  UIView + ext.swift
//  WorkoutApp
//
//  Created by Evhen Lukhtan on 25.01.2023.
//

import UIKit

extension UIView {
    
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height -  height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
    
    func makeSystem(_ botton: UIButton) {
        
        botton.addTarget(self, action: #selector(hendleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        botton.addTarget(self, action: #selector(hendleOut), for: [
            .touchUpInside,
            .touchDragOutside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func hendleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc func hendleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
    
    func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
