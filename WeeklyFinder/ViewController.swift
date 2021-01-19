//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Artem Listopadov on 1/18/21.
//  Copyright © 2021 Artem Listopadov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!

    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
    
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_Ru")
        formatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponent) else {return}
        let weekDay = formatter.string(from: date)
        let capitalizedWeekDay = weekDay.capitalized
   
        resultLabel.text = capitalizedWeekDay
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

