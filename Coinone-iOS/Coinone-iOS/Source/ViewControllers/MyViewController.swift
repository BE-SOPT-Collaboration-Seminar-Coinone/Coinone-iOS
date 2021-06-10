//
//  MyViewController.swift
//  Coinone-iOS
//
//  Created by 김지수 on 2021/05/15.
//
import UIKit

class MyViewController: UIViewController {
  
  @IBOutlet weak var underlineview: UIView!
  @IBOutlet weak var myTableView: UITableView!
  @IBOutlet weak var chartView: UIView!
  
  @IBAction func gaeraesobuttonclicked(_ sender: Any) {
    
    //    거래소 버튼 누르면 거래소로 넘어가게 //
    
    let georaesoVC = GeoraesoVC()
    self.navigationController?.pushViewController(georaesoVC, animated: false)
    
  }
    
    
    var myList : [MyListDataModel] = [MyListDataModel(logoImage: "coinIcon",
                                                      companyName: "TestCompany",
                                                      companyNameKR: "테스트 컴퍼니",
                                                      ratenum : "1,700.0",
                                                      riseRate :"77.7",
                                                      plusorminus: "+",
                                                      compareRiseRate: "1.11%",
                                                      GraphImage: "Graph Image"),
                                      
                                      
                                      MyListDataModel(logoImage: "coinIcon",
                                                      companyName: "TestCompany2",
                                                      companyNameKR: "테스트 컴퍼니2",
                                                      ratenum : "2,000.0",
                                                      riseRate :"88.8",
                                                      plusorminus: "+",
                                                      compareRiseRate: "99.99%",
                                                      GraphImage: "Graph Image")]
    
    //    Popup 창이 계속해서 반복해서 나오는 걸 탈출시키기 위해서 //
    var popupIsShown : Bool = false
    override func viewDidAppear(_ animated: Bool) {
      
      
      if popupIsShown == false{
        
        let storyboard = UIStoryboard(name: "MyPopup", bundle: nil)
        guard let mainVC =
                storyboard.instantiateViewController(identifier: "PopupViewController") as? PopupViewController else {return}
        
        
        mainVC.modalPresentationStyle = .overFullScreen
        mainVC.modalTransitionStyle = .crossDissolve
        
        self.present(mainVC, animated :true, completion: nil)
        
        popupIsShown = true
        
      }
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      

      self.underlineview.layer.cornerRadius = 3
      self.myTableView.delegate = self
      self.myTableView.dataSource = self
      self.myTableView.separatorStyle = .none
      
      //    chartView 뒤의 쉐도우 적용
      self.chartView.layer.applyShadow(color: .black, alpha: 0.12, x: 0, y: 0, blur: 8)
      self.navigationController?.navigationBar.isHidden = true
      
      
      // 서버통신
        
        GetMyDataService.shared.getMyInfo { (response) in
                    switch(response)
                    {
                    case .success(let myData):
                        if let data = myData as? MyDataModel {
                            for i in 0..<data.coin.count {
                                self.myList.append(MyListDataModel(
                                                    logoImage: data.coin[i].coinLogoImage,
                                                    companyName: data.coin[i].coinEnglishTitle,
                                                    companyNameKR: data.coin[i].coinKoreanTitle,
                                                    ratenum: data.coin[i].coinCurrentPrice,
                                                    riseRate: data.coin[i].degree,
                                                    plusorminus: data.coin[i].riseOrDescent,
                                                    compareRiseRate: data.coin[i].percentage,
                                                    GraphImage: data.coin[i].graphImage))
                            }
                            
                        }
                    case .requestErr :
                        print("requestERR")
                    case .pathErr :
                        print("pathERR")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                    }
                }
    }
    
    
    
    //  MyList 에 들어가는 Data ///
    
    }
    
  
  
  extension MyViewController : UITableViewDelegate
  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
      return UITableView.automaticDimension
      
      
    }
  }
  
  extension MyViewController : UITableViewDataSource
  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let myCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell
                                                        .identifier, for: indexPath)
              
              
              as? MyTableViewCell else {return UITableViewCell() }
      
      myCell.setData(logoImage: myList[indexPath.row].logoImage,
                     companyName: myList[indexPath.row].companyName,
                     companyNameKR: myList[indexPath.row].companyNameKR,
                     ratenum: myList[indexPath.row].ratenum,
                     riseRate: myList[indexPath.row].riseRate,
                     compareRiseRate: myList[indexPath.row].compareRiseRate,
                     GraphImage: myList[indexPath.row].GraphImage)
      
      return myCell
    }
  }
