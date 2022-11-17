//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Junne Murdock on 11/10/22.
//

import UIKit


class AthleteFormViewController: UIViewController {
    
    struct Propertykeys{
        static let unwindtoListSegue = "unwindToAthleteTableViewController"
    }
        var athlete: Athlete?
        
        @IBOutlet weak var nameText: UITextField!
        @IBOutlet weak var ageText: UITextField!
        @IBOutlet weak var leagueText: UITextField!
        @IBOutlet weak var teamText: UITextField!
        
        
        init?(coder: NSCoder, athlete: Athlete?){
            super.init(coder: coder)
            self.athlete = athlete
        }
        
        required init?(coder: NSCoder){
            fatalError("init(coder:) has not been implemented")
        }
        
        func updateView() {
            guard let athlete = athlete else {
                return
            }
            nameText.text = athlete.name
            teamText.text = athlete.team
            leagueText.text = athlete.league
            ageText.text = String(athlete.age)
            
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateView()
            
            
        }
   


    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = nameText.text, let ageString = ageText.text, let age = Int(ageString), let league = leagueText.text, let team = teamText.text else {return}
        
        athlete = Athlete(name: name, age: ageString, league: league, team: team)
        
        performSegue(withIdentifier: Propertykeys.unwindtoListSegue, sender: self)
    }
}
