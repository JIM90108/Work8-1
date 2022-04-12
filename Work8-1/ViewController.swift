//
//  ViewController.swift
//  Work8-1
//
//  Created by 彭有駿 on 2022/4/12.
//

import UIKit
import SpriteKit


class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthDay: UIDatePicker!
    @IBOutlet weak var gasolineSwitch: UISwitch!
    @IBOutlet weak var dieselfuelSwitch: UISwitch!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    
    
    //存取
    var carIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gasolineSwitch.isOn = false
        dieselfuelSwitch.isOn = false
        background()
        // Do any additional setup after loading the view.
    }
    
    
    //重置
    @IBAction func reset(_ sender: UIButton) {
        //變回原始模擬器剛開始的模樣
        carImage.image = UIImage(named: "background")
        carName.text = "車型"
        gasolineSwitch.isOn = false
        dieselfuelSwitch.isOn = false
        name.text = ""
        gender.selectedSegmentIndex = 0
    }
    
    //搜尋
    @IBAction func search(_ sender: UIButton) {
        SearchMyCar()
       
    }
    
    //點擊收鍵盤
    @IBAction func keyBoardOver(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
        }
    
    
    func SearchMyCar(){
        carIdx += 1
        //男生
        if gender.selectedSegmentIndex == 0{
            //每點擊一次搜尋都換切換圖片
            if carIdx < AllCarMessage.count{
                if gasolineSwitch.isOn == true && dieselfuelSwitch.isOn == true || gasolineSwitch.isOn == false && dieselfuelSwitch.isOn == false {
                    carName.text = AllCarMessage[carIdx].carName
                    carImage.image = UIImage(named: AllCarMessage[carIdx].carPic)
                } else if gasolineSwitch.isOn == true && dieselfuelSwitch.isOn == false{
                    if carIdx < allGasCarMessage.count{
                        carName.text = allGasCarMessage[carIdx].carName
                        carImage.image = UIImage(named: allGasCarMessage[carIdx].carPic)
                    }else{
                        carIdx = 0
                        carName.text = allGasCarMessage[carIdx].carName
                        carImage.image = UIImage(named: allGasCarMessage[carIdx].carPic)
                    }
                }else{
                    if carIdx < allDieselCarMessage.count{
                        carName.text = allDieselCarMessage[carIdx].carName
                        carImage.image = UIImage(named: allDieselCarMessage[carIdx].carPic)
                    }else{
                        carIdx = 0
                        carName.text = allDieselCarMessage[carIdx].carName
                        carImage.image = UIImage(named: allDieselCarMessage[carIdx].carPic)
                    }
                    
                }
                
            }else{
                carIdx = 0
                carName.text = AllCarMessage[carIdx].carName
                carImage.image = UIImage(named: AllCarMessage[carIdx].carPic)
                
            }
            
        }else{
            if carIdx < AllgirlsCarMessage.count{
                if gasolineSwitch.isOn == true && dieselfuelSwitch.isOn == true || gasolineSwitch.isOn == false && dieselfuelSwitch.isOn == false {
                    carName.text = AllgirlsCarMessage[carIdx].carName
                    carImage.image = UIImage(named: AllgirlsCarMessage[carIdx].carPic)
                }else if gasolineSwitch.isOn == true && dieselfuelSwitch.isOn == false {
                    if carIdx < AllgirlsGasCar.count {
                        carName.text = AllgirlsGasCar[carIdx].carName
                        carImage.image = UIImage(named: AllgirlsGasCar[carIdx].carPic)
                    }else{
                        carIdx = 0
                        carName.text = AllgirlsGasCar[carIdx].carName
                        carImage.image = UIImage(named: AllgirlsGasCar[carIdx].carPic)
                    }
                }else{
                    if carIdx < AllgirlsDieselCarMessage.count{
                        carName.text = AllgirlsDieselCarMessage[carIdx].carName
                        carImage.image = UIImage(named: AllgirlsDieselCarMessage[carIdx].carPic)
                    }else{
                        carIdx = 0
                        carName.text = AllgirlsDieselCarMessage[carIdx].carName
                        carImage.image = UIImage(named: AllgirlsDieselCarMessage[carIdx].carPic)
                    }
                }
                
            }else{
                carIdx = 0
                carName.text = AllgirlsCarMessage[carIdx].carName
                carImage.image = UIImage(named: AllgirlsCarMessage[carIdx].carPic)
            }
            
        }
        
    

    }
    
    //漸層背景
    func background(){
        let skView = SKView(frame: self.view.bounds)
        self.view.insertSubview(skView, at: 0)

        let scene = SKScene(size: skView.frame.size)
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0)
        skView.presentScene(scene)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds//讓漸層的大小等於 controller view 的大小
        gradientLayer.colors = [CGColor(srgbRed: 0, green: 1, blue: 1, alpha: 1),
                                CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 0.3)]
        
        skView.layer.addSublayer(gradientLayer )
        
        
    }

}
            
            
            
    

