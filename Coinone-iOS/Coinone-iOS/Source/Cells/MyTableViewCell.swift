//
//  MyTableViewCell.swift
//  Coinone-iOS
//
//  Created by 김지수 on 2021/05/19.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier : String = "MyTableViewCell"
    
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var CompanyName: UILabel!
    @IBOutlet weak var CompanyNameKR: UILabel!
    @IBOutlet weak var Ratenum: UILabel!
    @IBOutlet weak var RiseRate: UILabel!
    @IBOutlet weak var CompareRiseRate: UILabel!
    @IBOutlet weak var graphImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(    logoImage : String,
                     companyName : String,
                     companyNameKR : String,
                     ratenum : String,
                     riseRate : String,
                     compareRiseRate : String,
                     GraphImage : String
                     )
        {
        
//        불러오고 싶은 이미지가 여러개 인 경우 if let 구문을 여러번 사용해서 받아온다 //
            if let
                image = UIImage(named: logoImage)
            
            {
                LogoImage.image = image
            
            }
        self.LogoImage.imageFromUrl(logoImage, defaultImgPath: "https://sopt-8-coinone.s3.ap-northeast-2.amazonaws.com/KLAY.png")
//           if let
//                image = UIImage(named : RiseImage)
//           {
//                riseImage.image = image
//           }
            if let
                image = UIImage(named : GraphImage)
            {
                graphImage.image = image
            }
                    
            CompanyName.text = companyName
            CompanyNameKR.text = companyNameKR
            Ratenum.text = ratenum
            RiseRate.text = riseRate
            CompareRiseRate.text = compareRiseRate
       
        }
    
}
