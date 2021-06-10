//
//  GeoraesoVC.swift
//  Coinone-iOS
//
//  Created by soyeon on 2021/05/15.
//
import UIKit
import SnapKit

class GeoraesoVC: UIViewController {
    private var stockList: [StockModel] = []
    var menuTitles: [String] = ["마이", "거래소", "간편구매", "정보"]
    
    // MARK: - Header UI
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoOnwhite")
        return imageView
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "searchOnwhite"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        return button
    }()
    
    
    lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "마이"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var marketLabel: UILabel = {
        let label = UILabel()
        label.text = "거래소"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var easyTransLabel: UILabel = {
        let label = UILabel()
        label.text = "간편 구매"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "정보"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - CoinFilter Button UI
    private lazy var coinView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setBorder(borderColor: nil, borderWidth: nil)
        
        view.addSubview(coinLabel)
        view.addSubview(cFilterButton)
        
        coinLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(6)
            make.leading.equalTo(view.snp.leading).inset(8)
        }
        cFilterButton.snp.makeConstraints { make in
            make.centerY.equalTo(coinLabel)
            make.leading.equalTo(coinLabel.snp.trailing).inset(-38)
        }
        return view
    }()
    private lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.text = "코인명"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var cFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "switch"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        return button
    }()
    
    // MARK: - CurValueFilter Button UI
    private lazy var curValueView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setBorder(borderColor: nil, borderWidth: nil)
        
        view.addSubview(curValueLabel)
        view.addSubview(vFilterButton)
        
        curValueLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(6)
            make.leading.equalTo(view.snp.leading).inset(8)
        }
        vFilterButton.snp.makeConstraints { make in
            make.centerY.equalTo(curValueLabel)
            make.leading.equalTo(curValueLabel.snp.trailing).inset(-38)
        }
        
        return view
    }()
    private lazy var curValueLabel: UILabel = {
        let label = UILabel()
        label.text = "현재가"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var vFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "switch"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        return button
    }()
    
    // MARK: - RateFilterView UI
    private lazy var rateView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setBorder(borderColor: nil, borderWidth: nil)
        
        view.addSubview(rateLabel)
        view.addSubview(rFilterButton)
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(6)
            make.leading.equalTo(view.snp.leading).inset(8)
        }
        rFilterButton.snp.makeConstraints { make in
            make.centerY.equalTo(rateLabel)
            make.leading.equalTo(rateLabel.snp.trailing).inset(-10)
        }
        
        return view
    }()
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.text = "등락률"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textColor = UIColor.textGray
        return label
    }()
    private lazy var rFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "switch"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        return button
    }()
    
    // MARK: - TransPriceFilterView UI
    private lazy var transPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setBorder(borderColor: nil, borderWidth: nil)
        
        view.addSubview(transPriceLabel)
        view.addSubview(pFilterButton)
        
        transPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(6)
            make.leading.equalTo(view.snp.leading).inset(8)
        }
        pFilterButton.snp.makeConstraints { make in
            make.centerY.equalTo(transPriceLabel)
            make.leading.equalTo(transPriceLabel.snp.trailing).inset(-3)
        }
        
        return view
    }()
    private lazy var transPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "거래대금"
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        label.textColor = UIColor(red: 101.0 / 255.0, green: 101.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
        return label
    }()
    private lazy var pFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "switch"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        
        return button
    }()
    
    
    // MARK: - Table View
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .tableViewGray
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        
        tableView.register(StockTVC.self, forCellReuseIdentifier: StockTVC.identifier)
        
        return tableView
    }()
    
    // MARK: - Table Header View
    private lazy var tableHeaderView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .tableViewGray
        
        view.addSubview(tableHeaderLabel)
        view.addSubview(foldListButton)
        
        tableHeaderLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).inset(20)
            make.centerY.equalTo(view.snp.centerY)
        }
        foldListButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(10)
            make.height.equalTo(6)
        }
        
        return view
    }()
    
    private var tableHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Market"
        label.font = UIFont.init(name: "NotoSansKR-Bold", size: 12)
        label.textColor = UIColor(red: 101.0 / 255.0, green: 101.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    private let foldListButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 20,
                                                     weight: .light,
                                                     scale: .large),
                                               forImageIn: .normal)
        button.tintColor = .textGray
        button.addTarget(self, action: #selector(foldList(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfigure()
        setDummyData()
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        
        register()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - DummyData
    func setDummyData() {
        stockList.append(contentsOf: [
                            StockModel(logoImage: "coinLogo",
                                       title: "XRP",
                                       subTitle: "리플",
                                       curValue: 1625,
                                       riseOrDescent: "-",
                                       rate: 0.37,
                                       transPrice: 2059),
                            StockModel(logoImage: "coinLogo",
                                       title: "XRP",
                                       subTitle: "리플",
                                       curValue: 1625,
                                       riseOrDescent: "-",
                                       rate: 0.37,
                                       transPrice: 2489),
                            StockModel(logoImage: "coinLogo",
                                       title: "XRP",
                                       subTitle: "리플",
                                       curValue: 1625,
                                       riseOrDescent: "-",
                                       rate: 0.37,
                                       transPrice: 1280)])
    }
}

// MARK: - UI
extension GeoraesoVC {
    private func setConfigure() {
        setHeaderView()
        setTableView()
    }
    
    private func register() {
        self.topCollectionView.register(TopMenuCollectionViewCell.self, forCellWithReuseIdentifier: TopMenuCollectionViewCell.identifier)
    }
    
    private func setHeaderView() {
        view.addSubview(headerView)
        
        headerView.addSubview(logoImage)
        headerView.addSubview(searchButton)
        
        headerView.addSubview(topCollectionView)
        
        
        headerView.addSubview(coinView)
        headerView.addSubview(curValueView)
        headerView.addSubview(rateView)
        headerView.addSubview(transPriceView)
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(140)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(20)
            make.leading.equalTo(headerView.snp.leading).inset(20)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(20)
            make.leading.equalTo(headerView.snp.leading).inset(339)
        }
        
        topCollectionView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.leading.equalTo(headerView).inset(20)
            make.trailing.equalTo(headerView).inset(131)
            make.height.equalTo(30)
        }
        
        // MARK: - Filter Button Constraints
        coinView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(96)
            make.leading.equalTo(headerView.snp.leading).inset(20)
            make.width.equalTo(94)
            make.height.equalTo(30)
        }
        curValueView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(96)
            make.leading.equalTo(headerView.snp.leading).inset(118)
            make.width.equalTo(94)
            make.height.equalTo(30)
        }
        rateView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(96)
            make.leading.equalTo(headerView.snp.leading).inset(216)
            make.width.equalTo(66)
            make.height.equalTo(30)
        }
        transPriceView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).inset(96)
            make.leading.equalTo(headerView.snp.leading).inset(286)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - TableViewDelegate
extension GeoraesoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    @objc func foldList(_ sender: UIButton) {
        print("fold button touched")
        
        // TODO: - fold list action
    }
    
}

// MARK: - TableViewDataSource
extension GeoraesoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockTVC.identifier) as? StockTVC else {
            return UITableViewCell()
        }
        cell.contentView.backgroundColor = .tableViewGray
        
        let data = stockList[indexPath.row]
        cell.setData(coinLogoImageName: data.logoImage, coinEnglishTitle: data.title, coinKoreanTitle: data.subTitle, coinCurrentPrice: data.curValue, riseOrDescent: data.riseOrDescent, percentage: data.rate, coinTotalPrice: data.transPrice)
        return cell
    }
}

extension UITableView {
    func removeExtraCellLines() {
        tableFooterView = UIView(frame: .zero)
    }
}


extension GeoraesoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat
        switch indexPath.item {
        case 1:
            width = 45
        case 2:
            width = 60
        default:
            width = 30
        }
        return CGSize(width: width+self.view.frame.width*10/375, height: 30)
    }
}

// MARK: - UICollectionViewDataSource
extension GeoraesoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let topMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMenuCollectionViewCell.identifier, for: indexPath) as? TopMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        topMenuCell.titleLabel.setLabel(text: self.menuTitles[indexPath.item], textColor: .textGray, font: .notoSansKRBoldFont(fontSize: 16))
        if indexPath.item == 1 {
            topMenuCell.underLineView.isHidden = false
            topMenuCell.underLineView.backgroundColor = .black
            topMenuCell.titleLabel.textColor = .black
        }
        topMenuCell.awakeFromNib()
        return topMenuCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 && self.navigationController?.parent != nil {
            let storyBoard = UIStoryboard(name: "My", bundle: nil)
            guard let myViewController = storyBoard.instantiateViewController(identifier: "MyViewController") as? MyViewController else { return }
            self.navigationController?.pushViewController(myViewController, animated: false)
        }
        if indexPath.item == 0 && self.navigationController?.parent == nil {
            self.navigationController?.popViewController(animated: false)
        }
    }
}
