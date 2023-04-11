//
//  HomeViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 5.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var fromSelectTextField: UITextField!
    @IBOutlet var toSelectTextField: UITextField!
    @IBOutlet var selectTodayButton: UIButton!
    @IBOutlet var selectTomorrowButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var selectDateTextField: UITextField!
    
    
    let cities: [String] = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak"]
    
    var fromCityPickerView = UIPickerView()
    var toCityPickerView = UIPickerView()
    var datePickerView = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromCityPickerView.delegate = self
        fromCityPickerView.dataSource = self
        toCityPickerView.delegate = self
        toCityPickerView.dataSource = self
        fromSelectTextField.inputView = fromCityPickerView
        toSelectTextField.inputView = toCityPickerView
        
        selectDateTextField.inputView = datePickerView
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        selectDateTextField.inputAccessoryView = createToolBar()

        
    }
    
    
    @IBAction func todayButtonPressed(_ sender: Any) {
        let date = Date() // şu anki tarihi alır
        let dateFormatter = DateFormatter() // date formatlayıcı oluştur
        dateFormatter.dateFormat = "dd.MM.yyyy" // tarih formatı ayarla
        let today = dateFormatter.string(from: date)
        selectDateTextField.text = today
    }
    
    
    @IBAction func tomorrowButtonPressed(_ sender: Any) {
        let calendar = Calendar.current // mevcut takvimi al
        var dateComponents = DateComponents() // tarih bileşenlerini oluştur
        dateComponents.day = 1 // bir sonraki günü almak için "day" özelliğini 1 olarak ayarla
        let tomorrow = calendar.date(byAdding: dateComponents, to: Date()) // yarının tarihini hesapla
        let dateFormatter = DateFormatter() // date formatlayıcı oluştur
        dateFormatter.dateFormat = "dd.MM.yyyy" // tarih formatı ayarla
        let tomorrowString = dateFormatter.string(from: tomorrow!) // yarının tarihini formatlı şekilde string'e çevir
        selectDateTextField.text = tomorrowString
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        let companySelectionVC = UIStoryboard(name: "CompanySelect", bundle: nil).instantiateViewController(withIdentifier: "CompanySelectViewController") as! CompanySelectViewController
        
        companySelectionVC.modalPresentationStyle = .fullScreen
        self.present(companySelectionVC, animated: true)
        
    }
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func doneButtonPressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = .none
        
        self.selectDateTextField.text = dateFormatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
}

extension HomeViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == fromCityPickerView {
            
            fromSelectTextField.text = cities[row]
            TakeASeatSingleton.shared.fromCity = cities[row]
            fromSelectTextField.resignFirstResponder()
            
        }else{
            toSelectTextField.text = cities[row]
            TakeASeatSingleton.shared.toCity = cities[row]
            toSelectTextField.resignFirstResponder()
        }
        
        
    }
    
    
    
    
}
