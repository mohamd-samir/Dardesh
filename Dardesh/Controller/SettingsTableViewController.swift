//
//  SettingsTableViewController.swift
//  Dardesh
//
//  Created by Mohamed on 13/03/2024.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var avatarImageOutlet: UIImageView!
    @IBOutlet weak var appVersionLabelOutlet: UILabel!
    @IBOutlet weak var usernameLabelOutlet: UILabel!
    @IBOutlet weak var statusLabelOutlet: UILabel!
    
    //MARK: - Lifecycle of table view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showUserInfo()
    }
    
    //MARK: - IB Actions
    
    @IBAction func tellFriendButtonPressed(_ sender: UIButton) {
        print("Tell a Frinds")
    }
    
    @IBAction func termsButtonPressed(_ sender: UIButton) {
        print("Terms and Cnditions")
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        FUserListener.shared.logoutCurrentUser { (error) in
            
            if error == nil{
                let loginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginView")
                
                DispatchQueue.main.sync{
                    loginView.modalPresentationStyle = .fullScreen
                    self.present(loginView, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    //MARK: - Tableview Delegates
    
    
    // Change this value to decrease header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
       //  return section == 0 ? 0.0: 0.0
        return 0.0
    }
    
    
    // Change this value to decrease space between sections
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    
    // Hide sections name
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "colorTableview")
        return headerView
    }
    
    
    //الفانكشن دي علشان انتقل من عن اليوز الي التعديلات
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            performSegue(withIdentifier: "SettingsToEditProfileSeque", sender: self)
        }
        
    }
    
    //MARK: - Update UI
    private func showUserInfo(){
        if let user = User.currentUser {
            
            usernameLabelOutlet.text = user.userName
            statusLabelOutlet.text = user.status
            
            appVersionLabelOutlet.text = "App Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
            
            if user.avatarLink != "" {
                //TODO: Download and set avater image
            }
        }
    }
}

