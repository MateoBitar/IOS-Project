//
//  CalenderViewController.swift
//  IOS Assignment2
//
//  Created by Marco Bitar on 27/11/2024.
//  Copyright © 2024 Marco Bitar. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView.tag == 1 ? 2 : 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            if component == 0 {
                return countries.count
            } else {
                return cities[selectedCountry]?.count ?? 0
            }
        } else {
            return seasons.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            if component == 0 {
                return countries[row]
            } else {
                return cities[selectedCountry]?[row]
            }
        } else {
            return seasons[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            if component == 0 {
                selectedCountry = countries[row]
                pickerView.reloadComponent(1)
                selectedCity = cities[selectedCountry]?.first ?? ""
            } else {
                selectedCity = cities[selectedCountry]?.first ?? ""
            }
        } else {
            selectedSeason = seasons[row]
        }
        
        updateBaseCost()
        updateCost()
    }
    

    private let countriesComponent = 0
    private let citiesComponent = 1
    private let countries = ["USA","France","Turkey","Brazil","UK","Japan"]
    private let cities = [
        "USA": ["NYC","LA","Boston","Chicago"],
        "France": ["Paris","Nice","Lyon"],
        "Turkey": ["Istanbul","Adana"],
        "Brazil": ["Rio De Janeiro","Brazilia","Salvador"],
        "UK": ["London","Manchester","New Castle","Edinburgh"],
        "Japan": ["Tokyo","Kyoto","Narita"]]
    
    
    private let baseCosts = [
        "NYC": 1200,
        "Paris": 800,
        "Istanbul": 400,
        "Rio De Janeiro": 600,
        "London": 900,
        "Tokyo": 1000 ]
    
    
    func updateBaseCost(){
        baseCost = Double(baseCosts[selectedCity] ?? 400)
    }
    
    private let seasonModifiers = [
        "Spring": 1.0,
        "Summer": 1.2,
        "Fall": 0.9,
        "Winter": 1.1]
    
    private let seasons = [
        "Spring","Summer","Fall","Winter"]
    
    private var selectedCountry = "USA"
    private var selectedCity = "NYC"
    private var selectedSeason = "Spring"
    private var nbOfTravelers = 1
    private var baseCost: Double = 0
    
    
    @IBOutlet weak var destinationPicker: UIPickerView!
    @IBOutlet weak var seasonPicker: UIPickerView!
    @IBOutlet weak var date1Picker: UIDatePicker!
    @IBOutlet weak var date2Picker: UIDatePicker!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var travelersField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationPicker.delegate = self
        destinationPicker.dataSource = self
        seasonPicker.delegate = self
        seasonPicker.dataSource = self
        
        let date1 = NSDate()
        let date2 = NSDate()
        
        date1Picker.minimumDate = date1 as Date
        date1Picker.setDate(date1 as Date, animated: false)
        date2Picker.setDate(date2 as Date, animated: false)
        
        travelersField.text = "1"
        updateBaseCost()
        updateCost()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func departureDateChanged() {
        date2Picker.minimumDate = date1Picker.date
        
        if date2Picker.date < date1Picker.date {
            date2Picker.date = date1Picker.date
        }
    }
    
    @IBAction func updateCost() {
        let seasonMultiplier = seasonModifiers[selectedSeason] ?? 1.0
        let travelers = Int(travelersField.text ?? "1") ?? 1
        nbOfTravelers = travelers
        let totalCost = baseCost * seasonMultiplier * Double(travelers)
        total.text = "Total Cost: $\(totalCost)"
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let alert = UIAlertController(title: "Your trip plan", message: """
            Destination: \(selectedCountry), \(selectedCity)
            Season: \(selectedSeason)
            Dates: \(formatter.string(from: date1Picker.date)) - \(formatter.string(from: date2Picker.date))
            Travelers: \(nbOfTravelers)
            \(total.text ?? "$0")
            """,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onTapRecognizer(_ sender: AnyObject) {
        travelersField.resignFirstResponder()
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
