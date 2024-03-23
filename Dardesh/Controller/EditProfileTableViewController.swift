//
//  EditProfileTableViewController.swift
//  Dardesh
//
//  Created by Mohamed on 19/03/2024.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        showUserInfo()


    }
    
    //MARK: -  IBOutlets
    
    @IBOutlet weak var avatarImageViewOutlet: UIImageView!
    @IBOutlet weak var usernameTextFieldOutlet: UITextField!
    @IBOutlet weak var statusLabelOutLet: UILabel!
    
    
    
    
    
    //MARK: - IBActions
    
    @IBAction func editButtnPressed(_ sender: UIButton) {
    }
    

    // MARK: - Table view data source
    
    // Change this value to decrease header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//         return section == 0 || section == 1 ? 0.0 :30.0
        return 0
    }
    
    // Change this value to decrease space between sections
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    // Hide sections name
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "colorTableview")
        
        return headerView
    }
    
    //MARK: - Show User Info
    
    private func showUserInfo() {
        if let user = User.currentUser{
            
            usernameTextFieldOutlet.text = user.userName
            statusLabelOutLet.text = user.status
            
            if user.avatarLink != ""{
                //set avater image
            }
        }
    }

}
