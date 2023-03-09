//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Evhen Lukhtan on 24.01.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearence()
        switchTo(tab: .session)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearence() {
        
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
                
//        let overviewController = OverviewController()
//        let sessionController = SessionController()
//        let progressController = ProgressController()
//        let settingsController = SettingsController()
//
//        let overviewNavigation = NavBarController(rootViewController: overviewController)
//        let sessionNavigation = NavBarController(rootViewController: sessionController)
//        let progressNavigation = NavBarController(rootViewController: progressController)
//        let settingsNavigation = NavBarController(rootViewController: settingsController)
//
//        overviewNavigation.tabBarItem = UITabBarItem(title: Resoucers.Strings.TabBar.overview,
//                                                     image: Resoucers.Images.TabBar.overview,
//                                                     tag: Tabs.overview.rawValue)
//        sessionNavigation.tabBarItem = UITabBarItem(title: Resoucers.Strings.TabBar.session,
//                                                     image: Resoucers.Images.TabBar.session,
//                                                     tag: Tabs.session.rawValue)
//        progressNavigation.tabBarItem = UITabBarItem(title: Resoucers.Strings.TabBar.progress,
//                                                     image: Resoucers.Images.TabBar.progress,
//                                                     tag: Tabs.progress.rawValue)
//        settingsNavigation.tabBarItem = UITabBarItem(title: Resoucers.Strings.TabBar.settings,
//                                                     image: Resoucers.Images.TabBar.settings,
//                                                     tag: Tabs.settings.rawValue)
//
//        setViewControllers([overviewNavigation,
//                            sessionNavigation,
//                            progressNavigation,
//                            settingsNavigation],
//                           animated: false)
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> WABaseController {
        switch tab {
        case .overview: return OverviewController()
        case .session: return SessionController()
        case .progress: return ProgressController()
        case .settings: return SettingsController()
        }
    }
}
