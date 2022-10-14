//
//  ViewController.swift
//  CustomizeTabBarWIthMiddleButton
//
//  Created by Nitin Bhatia on 06/10/22.
//

struct card {
    var pic = UIImage()
    var title = String()
    var id = String()
    var expiry = String()
    var issuer = String()
}


import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet var cardView: UIView!
    @IBOutlet var idView: UIView!
    @IBOutlet var healthView: UIView!
    @IBOutlet var studentView: UIView!
    @IBOutlet var idRing: UIView!
    @IBOutlet var healthRing: UIView!
    @IBOutlet var studentRing: UIView!
    @IBOutlet var btnId: UIButton!
    @IBOutlet var btnHealth: UIButton!
    @IBOutlet var btnStudent: UIButton!
    @IBOutlet var lblCardNumber: UILabel!
    @IBOutlet var lblExpiryCard: UILabel!
    @IBOutlet var lblIssuerCard: UILabel!
    @IBOutlet var btnCopyToClipBoard: UIButton!
    @IBOutlet var copiedTextNotif: UIView!
    
    
    //variables
    lazy var cardViews = [idView,
                          healthView,
                          studentView]
    lazy var ringViews = [idRing,
                          healthRing,
                          studentRing]
    
    lazy var labels = [lblCardNumber,
                       lblExpiryCard,
                       lblIssuerCard]
    
    
    var idCard = card(id: "1234567890",
                      expiry: "06/25",
                      issuer: "Town Hall")
    
    var healthCard = card(id: "369121518",
                          expiry: "01/27",
                          issuer: "Doctor")
    
    var studentCard = card(id: "235711131719",
                           expiry: "2/03/2029",
                           issuer: "University")
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up card view here
        copiedTextNotif.alpha = 0
        
        cardView.layer.cornerRadius = 25
        
        cornerRadius(views: cardViews)
        cornerRadius(views: ringViews)
        
        btnCopyToClipBoard.layer.cornerRadius = btnCopyToClipBoard.frame.height / 2
        
    }
    
    //MARK: action for card switch
    func switchCard(selected: UIButton) {
        
        for label in labels {
            if let label = label {
                self.labelDisappears(label: label)
            }
        }
        
        switch selected {
            
        case btnId:
            lblCardNumber.text = idCard.id
            lblExpiryCard.text = idCard.expiry
            lblIssuerCard.text = idCard.issuer
        case btnHealth:
            lblCardNumber.text = healthCard.id
            lblExpiryCard.text = healthCard.expiry
            lblIssuerCard.text = healthCard.issuer
        case btnStudent:
            lblCardNumber.text = studentCard.id
            lblExpiryCard.text = studentCard.expiry
            lblIssuerCard.text = studentCard.issuer
            
        default: return
            
        }
        
    }
    
    
    //MARK: corner radius for views
    func cornerRadius(views: [UIView?]) {
        
        for view in views {
            if let view = view {
                
                view.layer.cornerRadius = view.frame.width / 2
                
            }
        }
    }

    //MARK: appearing labels with aimation on card switch
    
    func labelAppears(label: UILabel) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5) {
            
            label.alpha = 1
            
        }
        
    }
    
    //MARK: disappears labels with aimation on card switch
    func labelDisappears(label: UILabel) {
        
        UIView.animate(withDuration: 0.5,
                           delay: 0.5) {
            
            label.alpha = 0
            self.labelAppears(label: label)
            
        }
        
    }
    
    //MARK: different card button tapped action
    func buttonTapped(button: UIButton) {
        
        for view in cardViews {
            
            if let view = view {
                
                view.layer.borderWidth = 0
                
            }
            
        }
        
        switch button {
            
        case btnId:
            idView.layer.borderWidth = 5
            idView.layer.borderColor = UIColor.purple.cgColor
            switchCard(selected: btnId)
            
        case btnHealth:
            healthView.layer.borderWidth = 5
            healthView.layer.borderColor = UIColor.purple.cgColor
            switchCard(selected: btnHealth)
            
        case btnStudent:
            studentView.layer.borderWidth = 5
            studentView.layer.borderColor = UIColor.purple.cgColor
            switchCard(selected: btnStudent)
            
        default: return
            
        }
        
    }
    
    //MARK: copied text alert animation
    func copiedTextAlert() {
        
        copiedTextNotif.alpha = 1
        UIView.animate(withDuration: 5, delay: 0) {
            
            self.copiedTextNotif.alpha = 0
            
        }
    }
    
    //MARK: id button tap action
    @IBAction func idButtonTapped(_ sender: Any) {
        buttonTapped(button: btnId)
    }
    
    //MARK: health button tap action
    @IBAction func healthButtonTapped(_ sender: Any) {
        buttonTapped(button: btnHealth)
    }
    
    //MARK: student button tap action
    @IBAction func studentButtonTapped(_ sender: Any) {
        buttonTapped(button: btnStudent)
    }
    
    //MARK: copy to clipboard tap action
    @IBAction func copyToCBAction(_ sender: Any) {
        UIPasteboard.general.string = lblCardNumber.text
        copiedTextAlert()
    }

}
