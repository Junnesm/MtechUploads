//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Junne Murdock on 11/10/22.
//

import UIKit


class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var leagueText: UITextField!
    @IBOutlet weak var teamText: UITextField!
    
    @IBAction func persist(_ sender: Any) {
        
        guard let name = nameText.text, let age = ageText.text, let league = leagueText.text, let team = teamText.text  else
        { return }
            
            athlete = Athlete(name: name, age: age, league: league, team: team)
           
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateFormView () {
        if let confirmedAthlete = athlete as? Athlete {
            print ("confirmed \(confirmedAthlete)!")
            
            nameText.text = confirmedAthlete.name
            teamText.text = confirmedAthlete.team
            leagueText.text = confirmedAthlete.league
            ageText.text = confirmedAthlete.age
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
