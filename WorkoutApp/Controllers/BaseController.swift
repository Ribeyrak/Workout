//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Evhen Lukhtan on 25.01.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHendler() {
        print("NavBar left button tapped")
    }
    
    func navBarRightButtonHendler() {
        print("NavBar right button tapped")
    }
}

extension BaseController {
    
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helvelticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHendler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHendler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}