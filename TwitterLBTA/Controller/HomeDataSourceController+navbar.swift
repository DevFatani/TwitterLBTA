//
//  HomeDataSourceController+navbar.swift
//  TwitterLBTA
//
//  Created by Muhammad Fatani on 02/02/2019.
//  Copyright © 2019 Muhammad Fatani. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
     func setupNavigationBarItems(){
        setupRemainingNavItems()
        setupLeftNavItems()
        setupRightNavItems()
    }
    
    private func setupRemainingNavItems() {
        let twitterLogo = #imageLiteral(resourceName: "twitter").withSize(targetSize:  CGSize(width: 35, height: 35))
        let logo = UIImageView(image: twitterLogo)
        logo.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        
        navigationController?.navigationBar.barTintColor = .red
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navbarSepratorView = UIView()
        navbarSepratorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navbarSepratorView)
        navbarSepratorView.translatesAutoresizingMaskIntoConstraints = false
        navbarSepratorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
     followButton.setImage(#imageLiteral(resourceName: "account-plus").withSize(targetSize: CGSize(width: 35, height: 35)).withRenderingMode(.alwaysOriginal), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "magnify").withSize(targetSize: CGSize(width: 35, height: 35)).withRenderingMode(.alwaysOriginal), for: .normal)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "plus-circle-outline").withSize(targetSize: CGSize(width: 35, height: 35)).withRenderingMode(.alwaysOriginal), for: .normal)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)]
    }
}
