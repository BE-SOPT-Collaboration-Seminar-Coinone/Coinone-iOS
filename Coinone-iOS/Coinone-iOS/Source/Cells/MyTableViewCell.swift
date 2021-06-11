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
}
extension MyTableViewCell{
    
    func setData(    logoImage : String,
                     companyName : String,
                     companyNameKR : String,
                     ratenum : String,
                     riseRate : String,
                     plusorminus : String,
                     compareRiseRate : String,
                     GraphImage : String
                     )
        {
        

          
        self.LogoImage.imageFromUrl(logoImage, defaultImgPath: "https://sopt-8-coinone.s3.ap-northeast-2.amazonaws.com/KLAY.png")
        self.CompanyName.setLabel(text: companyName, textColor: .black, font: .notoSansKRBoldFont(fontSize: 14))
        self.CompanyNameKR.setLabel(text: companyNameKR, textColor: .coinGray, font: .notoSansKRMediumFont(fontSize: 10))
        self.Ratenum.setLabel(text: ratenum, textColor: .black, font: .notoSansKRBoldFont(fontSize: 14))
        if plusorminus == "+" {
            self.RiseRate.setLabel(text: riseRate, textColor: .textRed, font: .boldSystemFont(ofSize: 14))
            self.CompareRiseRate.setLabel(text: "\(plusorminus)\(compareRiseRate)%", textColor: .textRed, font: .systemFont(ofSize: 14, weight: .regular))
        }
        else {
            self.RiseRate.setLabel(text: riseRate, textColor: .mainBlue, font: .boldSystemFont(ofSize: 14))
            self.CompareRiseRate.setLabel(text: "\(plusorminus)\(compareRiseRate)%", textColor: .mainBlue, font: .systemFont(ofSize: 14, weight: .regular))
        }
        self.graphImage.imageFromUrl(GraphImage, defaultImgPath: "https://sopt-8-coinone.s3.ap-northeast-2.amazonaws.com/KLAY_graph.png")
        
                    
//            CompanyName.text = companyName
//            CompanyNameKR.text = companyNameKR
//            Ratenum.text = ratenum
//            RiseRate.text = riseRate
//            CompareRiseRate.text = compareRiseRate
       
        }
    
}
