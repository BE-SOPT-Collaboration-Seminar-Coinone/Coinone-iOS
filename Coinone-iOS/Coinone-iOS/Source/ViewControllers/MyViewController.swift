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
  
  var myList : [MyListDataModel] = []
  var popupIsShown : Bool = false
  
  override func viewDidAppear(_ animated: Bool) {
    
    
    if popupIsShown == false{
      
      let storyboard = UIStoryboard(name: "MyPopup", bundle: nil)
      guard let mainVC =
              storyboard.instantiateViewController(identifier: "PopupViewController") as? PopupViewController else {return}
      
      
      mainVC.modalPresentationStyle = .overCurrentContext
      mainVC.modalTransitionStyle = .crossDissolve
      
      self.present(mainVC, animated :true, completion: nil)
      
      popupIsShown = true
      
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    setMyList()
    self.underlineview.layer.cornerRadius = 3
    self.myTableView.delegate = self
    self.myTableView.dataSource = self
    self.myTableView.separatorStyle = .none
    

    self.chartView.layer.applyShadow(color: .black, alpha: 0.12, x: 0, y: 0, blur: 8)
    
    
    
  }
  
  
  
  
  func setMyList()
  {
    myList.append(contentsOf: [
      MyListDataModel(logoImage: "coinIcon",
                      companyName: "TestCompany",
                      companyNameKR: "테스트 컴퍼니",
                      ratenum : "1,700.0",
                      riseRate :"77.7",
                      RiseImage: "Rise Image",
                      compareRiseRate: "+1.11%",
                      GraphImage: "Graph Image"),
      
      
      MyListDataModel(logoImage: "coinIcon",
                      companyName: "TestCompany2",
                      companyNameKR: "테스트 컴퍼니2",
                      ratenum : "2,000.0",
                      riseRate :"88.8",
                      RiseImage: "Rise Image",
                      compareRiseRate: "+99.99%",
                      GraphImage: "Graph Image"),
      
      
    ])
  }
  
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
                   RiseImage: myList[indexPath.row].RiseImage,
                   compareRiseRate: myList[indexPath.row].compareRiseRate,
                   GraphImage: myList[indexPath.row].GraphImage)
    
    return myCell
  }
}
