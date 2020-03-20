//
//  SettingVC.swift
//  Weather
//
//  Created by leslie on 3/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var selectTemperature: UISegmentedControl!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.dataSource = self
        picker.delegate = self
        picker.selectRow(AppData.selectedCity, inComponent: 0, animated: true)
        
        if AppData.celsius {
            selectTemperature.selectedSegmentIndex = 0
        } else {
            selectTemperature.selectedSegmentIndex = 1
        }
        
    }
    
    @IBAction func changeTemperature(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            AppData.celsius = true
        } else {
            AppData.celsius = false
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

extension SettingVC: UIPickerViewDataSource, UIPickerViewDelegate {
    //MARK: - Picker Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AppData.citiesName.count
    }
    
    //MARK: - Picker Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AppData.citiesName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        AppData.selectedCity = row
    }
}
