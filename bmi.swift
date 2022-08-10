//
//  ViewController.swift
//  CalculationOfWeight
//
//  Created by Danil Bochkarev on 10.08.2022.
//

import UIKit

class ViewController: UIViewController {

    //лейблы которые будут изменятся
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var growthLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //слайдеры для внесения мин и макс данных
    @IBOutlet weak var sliderW: UISlider! {
        didSet {
            sliderW.maximumValue = 250
            sliderW.minimumValue = 10
            sliderW.value = 0
        }
    }
    
    @IBOutlet weak var sliderG: UISlider! {
        didSet {
            sliderG.maximumValue = 500
            sliderG.minimumValue = 5
            sliderG.value = 0
        }
    }
    
    var a:Double = 0
    var b:Double = 0
    
    
    //что будет менять при изменении слайдера высоты
    @IBAction func weightSlider(_ sender: UISlider) {
        let weightS = Int(round(sliderW.value))
        weightLabel.text = "Body Weight : \(weightS)"
        a = Double(weightS)
    }
    
    
    //что будет менять при изменении слайдера веса
    @IBAction func growthSlider(_ sender: Any) {
        let growthS = Int(round(sliderG.value))
        growthLabel.text = "Body Growth : \(growthS)"
        b = Double(growthS)
    }
    
    //кнопка калькулет берет значения роста и веса
    //и считает ИМТ
    @IBAction func calculateResult(_ sender: UIButton) {
        var imt:Double = 0
        imt = (b)/((a / 100) * (a / 100))
        
        let result = Int(round(imt))
        
        switch result {
        case 0...16:
            resultLabel.text = ("Low weight")
        case 17...30:
            resultLabel.text = ("Normal weight")
        case 31...37:
            resultLabel.text = ("First-degree obesity")
        case 38...43:
            resultLabel.text = ("2nd degree obesity")
        default:
            resultLabel.text = ("3rd degree obesity")
        }
    }
}

