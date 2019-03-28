//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by Muhammad Fatani on 02/02/2019.
//  Copyright © 2019 Muhammad Fatani. All rights reserved.
//

import LBTAComponents
class TweetCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {
                return
            }
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes:
                [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
                ]
            )
            
            let usernameString = " \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string:usernameString, attributes:
                [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                    NSAttributedString.Key.foregroundColor: UIColor.gray,
                    
                ]))
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string:tweet.message, attributes:
                [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
                    
                    ]))
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
       let tv = UITextView()
        tv.backgroundColor = .clear
        return tv
    }()
    
    let profileImageView:CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "twitter")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "replay").withSize(targetSize: CGSize(width: 20, height: 20)), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "twitter-retweet").withSize(targetSize: CGSize(width: 20, height: 20)), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "heart").withSize(targetSize: CGSize(width: 20, height: 20)), for: .normal)
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "forum").withSize(targetSize: CGSize(width: 20, height: 20)), for: .normal)
        return button
    }()
    override func setupViews() {
        super.setupViews()
        
        separatorLineView .isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(messageTextView)
        addSubview(replyButton)
        addSubview(retweetButton)
        
            profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        
        let replyButtonContainerView = UIView()
//        replyButtonContainerView.backgroundColor = .red
        
        let retweetButtonContainerView = UIView()
//        retweetButtonContainerView.backgroundColor = .blue
        
        let likeButtonContainerView = UIView()
//        likeButtonContainerView.backgroundColor = .green
        
        let directMessageButtonContainerView = UIView()
//        directMessageButtonContainerView.backgroundColor = .purple
        
        let stackViews = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        stackViews.axis = .horizontal
        stackViews.distribution = .fillEqually
        
        addSubview(stackViews)
        
        stackViews.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
         directMessageButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
