//
//  ViewController.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 11/09/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var photoScroll: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var aboutScroll: UIScrollView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var noteButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var friendsCount: UIButton!
    @IBOutlet weak var followersCount: UIButton!
    @IBOutlet weak var groupsCount: UIButton!
    @IBOutlet weak var photosCount: UIButton!
    @IBOutlet weak var videoCount: UIButton!
    @IBOutlet weak var audioCount: UIButton!
    @IBOutlet weak var documentsCount: UIButton!
    @IBOutlet weak var giftsCount: UIButton!
    
    let navigationBarColor = UIColor.init(red: 89/255.0, green: 125/255.0, blue: 163/255.0, alpha: 1.0)
    let borderColor = UIColor.init(red: 184/255.0, green: 184/255.0, blue:184/255.0, alpha: 1.0).cgColor
    let surnameArray = ["Ivanov","Petrov","Sidorov"]
    let nameArray = ["Ivan", "Anton", "Vlad"]
    let ageArray = ["18 years old,", "21 years old,", "35 years old,"]
    let locationArray = ["Kirov", "Kazan", "Moscow"]
    let borderThickness: CGFloat = 0.5
    let avatarCornersMultiply: CGFloat = 10
    let friendsConst = "friends"
    let followersConst = "followers"
    let groupsConst = "groups"
    let photosConst = "photos"
    let videosConst = "videos"
    let audiosConst = "audios"
    let giftsConst = "gifts"
    let docsConst = "docs"
    let randomConst: UInt32 = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomName()
        randomSurname()
        randomAge()
        randomLocation()
        avatarCorners()
        topAboutScrollBorder()
        bottomAboutScrollBorder()
        bottomPhotoScrollBorder()
        photoButtonBorder()
        noteButtonBorder()
        randomInInfoScroll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = navigationBarColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    func randomName() {
        
        nameLabel.text = nameArray[Int(arc4random_uniform(UInt32(nameArray.count)))]
        navigationItem.title = nameLabel.text
        nameLabel.sizeToFit()
        
    }
    
    func randomSurname() {
        
        surnameLabel.text = surnameArray[Int(arc4random_uniform(UInt32(surnameArray.count)))]
        surnameLabel.sizeToFit()
        
    }
    
    func randomAge() {
        
        ageLabel.text = ageArray[Int(arc4random_uniform(UInt32(ageArray.count)))]
        ageLabel.sizeToFit()
        
    }
    
    func randomLocation() {
        
        locationLabel.text = locationArray[Int(arc4random_uniform(UInt32(locationArray.count)))]
        locationLabel.sizeToFit()
        
    }
    
    func randomInInfoScroll() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        let color = UIColor.black

        
        let friends = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(friendsConst)",
                                                         attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        friendsCount.setAttributedTitle(friends, for: .normal)
        
        let followers = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(followersConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle ])
        followersCount.setAttributedTitle(followers, for: .normal)
        
        let groups = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(groupsConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        groupsCount.setAttributedTitle(groups, for: .normal)
        
        let photos = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(photosConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        photosCount.setAttributedTitle(photos, for: .normal)
        
        let videos = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(videosConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        videoCount.setAttributedTitle(videos, for: .normal)
        
        let audios = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(audiosConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        audioCount.setAttributedTitle(audios, for: .normal)
        
        let gifts = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(giftsConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle])
        giftsCount.setAttributedTitle(gifts, for: .normal)
        
        let docs = NSAttributedString(string: "\(arc4random_uniform(randomConst)) \(docsConst)",
            attributes: [NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName:paragraphStyle ])
        documentsCount.setAttributedTitle(docs, for: .normal)

    }
    
    func avatarCorners() {
        avatar.layer.cornerRadius = avatarCornersMultiply
        avatar.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 50)
    }
    
    func bottomAboutScrollBorder() {
        
        let border = CALayer()
        border.backgroundColor = borderColor
        border.frame = CGRect(x: 0, y: aboutScroll.frame.height - borderThickness, width: aboutScroll.frame.width, height: borderThickness)
        aboutScroll.layer.addSublayer(border)
        
    }
    
    func topAboutScrollBorder() {
        
        let border = CALayer()
        border.backgroundColor = borderColor
        border.frame = CGRect(x: 0, y: 0, width: aboutScroll.frame.width, height: borderThickness)
        aboutScroll.layer.addSublayer(border)

    }
    
    func bottomPhotoScrollBorder() {
        
        let border = CALayer()
        border.backgroundColor = borderColor
        border.frame = CGRect(x: 0, y: photoScroll.frame.height - borderThickness, width: photoScroll.frame.width, height: borderThickness)
        
        photoScroll.layer.addSublayer(border)
        
    }
    
    func photoButtonBorder() {
        let border = CALayer()
        border.backgroundColor = borderColor
        border.frame = CGRect(x: photoButton.frame.width - borderThickness, y: 0, width: borderThickness, height: photoButton.frame.height)
        
        photoButton.layer.addSublayer(border)
    }
    
    func noteButtonBorder() {
        
        let border = CALayer()
        border.backgroundColor = borderColor
        border.frame = CGRect(x: noteButton.frame.width - borderThickness, y: 0, width: borderThickness, height: noteButton.frame.height)
        
        noteButton.layer.addSublayer(border)
        
    }
    
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

