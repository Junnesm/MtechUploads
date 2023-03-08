//
//  DisplayUsersTableViewController.swift
//  UserAPIApp
//
//  Created by Junne Murdock on 2/28/23.
//

import UIKit


class DisplayUsersTableViewController: UITableViewController {
    
    var inclusionParameters = [String]()
    var user = [Response]()
    var userAmount = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userData()
        overrideUserInterfaceStyle = .dark
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRandom", for: indexPath) as! DisplayUserTableViewCell
        
        let randomUser = user[indexPath.row]
        
        cell.nameLabel.text = "\(randomUser.results[0].name.first) \(randomUser.results[0].name.last)"
        cell.userImageView.image = UIImage(contentsOfFile: randomUser.results[0].picture.large)
        
        if let _ = randomUser.results[0].dob?.age {
            cell.dOBIdentifier.text = String(randomUser.results[0].dob!.age)
            cell.dOBLabel.text = "DOB:"
        }
        
        if let email = randomUser.results[0].email,!email.isEmpty {
            cell.emailIdentifier.text = randomUser.results[0].email
            cell.emailLabel.text = "Email:"
        }
        
        if let location = randomUser.results[0].location?.city,!location.isEmpty {
            cell.locationIdentifier.text = randomUser.results[0].location!.city
            cell.locationLabel.text = "Location:"
        }
        
        
        if let gender = randomUser.results[0].gender,!gender.isEmpty {
            cell.genderIdentifier.text = randomUser.results[0].gender
            cell.genderLabel.text = "Gender:"
        }
        
        
        if let login = randomUser.results[0].login?.password, !login.isEmpty {
            cell.loginIdentifier.text = randomUser.results[0].login!.password
            cell.loginLabel.text = "Login:"
        }
        
        
        if let registered = randomUser.results[0].registered?.date, !registered.isEmpty {
            cell.registeredIdentifier.text = randomUser.results[0].registered?.date
            cell.registeredLabel.text = "Registered:"
        }
        
    
        if let phone = randomUser.results[0].phone, !phone.isEmpty {
            cell.phoneIdentifier.text = randomUser.results[0].phone
            cell.phoneLabel.text = "Phone:"
        }
        
        
        if let cells = randomUser.results[0].cell, !cells.isEmpty {
            cell.cellIdentifier.text = randomUser.results[0].cell
            cell.cellLabel.text = "Cell:"
        }
        
        
        if let id = randomUser.results[0].id?.name, !id.isEmpty {
            cell.iDIdentifier.text = randomUser.results[0].id?.name
            cell.iDLabel.text = "ID:"
        }
        
        
        if let nat = randomUser.results[0].nat, !nat.isEmpty {
            cell.natIdentifier.text = randomUser.results[0].nat
            cell.natLabel.text = "Nat:"
        }
        
        
        
        if let imageUrl = URL(string: randomUser.results[0].picture.large) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                } else if let data = data {
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        cell.userImageView.image = image
                        
                    }
                }
            }.resume()
        }
        
        return cell
    }
    
    
    func userData() {
        Task {
            do {
                let randomApiController = RandomAPI.RandomAPIController()
                for _ in 1...userAmount {
                    
                    let randomUser = try await randomApiController.fetchRandomUser(userAmount: userAmount, inclusionParameters)
                    user.append(randomUser)
                }
                
                tableView.reloadData()
                
            } catch {
                
                print("broke")
            }
        }
    }
}



