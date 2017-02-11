//
//  NewsViewController.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/6.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON
import RainyRefreshControl
class NewsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    let homePageUrl = "http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%5B%5D=5282&start=0&count=10&platform=ireader&device=Unknown%20iPad&version=5.2.3&system_version=10.2&hash=9d3ecafe1ff4ebc82ae2b9411cf309f8&format=json"
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var tbView: UITableView!
    var pageIndex = 0
    var dataSource: [NewsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.dataSource = self
        tbView.delegate = self
        nameLable.text = "第\(pageIndex)页面"
        fillDataSource()
        let refresh = RainyRefreshControl()
        refresh.addTarget(self, action: #selector(loadMore), for: .valueChanged)
        tbView.addSubview(refresh)
        
    }
    func loadMore(index: Int) {
        print("加载更多")
        fillDataSource()
    }
    func fillDataSource() {
        networkRequest()
    }
    func networkRequest() {
        Alamofire.request(URL(string: homePageUrl)!, method: .get, parameters: .none).responseJSON { (responese) in
            guard let responese = responese.result.value else { return() }
            guard let resultArr = responese as? [NSDictionary] else { return () }
            resultArr.forEach({ (data) in
                let newsModel = NewsModel(fromDictionary: data)
                self.dataSource.append(newsModel)
            })
            print(self.dataSource.count)
            DispatchQueue.main.async {
                self.tbView.reloadData()
            }

            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
            let simpleNews = dataSource[indexPath.row]
            cell.ImgView.sd_setImage(with: URL(string: "http://images.infzm.com/medias/\(simpleNews.media ?? "")"))
            cell.titleLabel.text = simpleNews.shortSubject ?? ""
            cell.cateLabel.text = "\(simpleNews.source ?? "")  分享\(simpleNews.shareCount ?? 0)人"
            cell.timeLabel.text = "\(simpleNews.displayTime.stringToDate()?.detlaString() ?? "🐱🐱🐱")"
        return cell
        
    }
    //MARK: TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("🐱🐱🐱🐱🐱🐱选中了\(indexPath.row)行")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }

    
    
    
    
    

}
