//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct NewsModel{

	var abstractMedias : [AnyObject]!
	var activityStatus : String!
	var author : String!
	var authorAvatar : String!
	var catId : String!
	var categories : String!
	var commentCount : Int!
	var contentType : String!
	var created : String!
	var displayTime : String!
	var id : String!
	var introtext : String!
	var isHot : Bool!
	var linkId : String!
	var linkUrl : String!
	var media : String!
	var modified : String!
	var ordering : String!
	var publishTime : String!
	var shareCount : Int!
	var shortSubject : String!
	var snsShare : SnsShare!
	var source : String!
	var status : String!
	var subSubject : String!
	var subject : String!
	var tag : String!
	var template : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		abstractMedias = dictionary["abstract_medias"] as? [AnyObject]
		activityStatus = dictionary["activity_status"] as? String
		author = dictionary["author"] as? String
		authorAvatar = dictionary["author_avatar"] as? String
		catId = dictionary["cat_id"] as? String
		categories = dictionary["categories"] as? String
		commentCount = dictionary["comment_count"] as? Int
		contentType = dictionary["content_type"] as? String
		created = dictionary["created"] as? String
		displayTime = dictionary["display_time"] as? String
		id = dictionary["id"] as? String
		introtext = dictionary["introtext"] as? String
		isHot = dictionary["is_hot"] as? Bool
		linkId = dictionary["link_id"] as? String
		linkUrl = dictionary["link_url"] as? String
		media = dictionary["media"] as? String
		modified = dictionary["modified"] as? String
		ordering = dictionary["ordering"] as? String
		publishTime = dictionary["publish_time"] as? String
		shareCount = dictionary["share_count"] as? Int
		shortSubject = dictionary["short_subject"] as? String
		if let snsShareData = dictionary["snsShare"] as? NSDictionary{
				snsShare = SnsShare(fromDictionary: snsShareData)
			}
		source = dictionary["source"] as? String
		status = dictionary["status"] as? String
		subSubject = dictionary["sub_subject"] as? String
		subject = dictionary["subject"] as? String
		tag = dictionary["tag"] as? String
		template = dictionary["template"] as? String
        
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if abstractMedias != nil{
			dictionary["abstract_medias"] = abstractMedias
		}
		if activityStatus != nil{
			dictionary["activity_status"] = activityStatus
		}
		if author != nil{
			dictionary["author"] = author
		}
		if authorAvatar != nil{
			dictionary["author_avatar"] = authorAvatar
		}
		if catId != nil{
			dictionary["cat_id"] = catId
		}
		if categories != nil{
			dictionary["categories"] = categories
		}
		if commentCount != nil{
			dictionary["comment_count"] = commentCount
		}
		if contentType != nil{
			dictionary["content_type"] = contentType
		}
		if created != nil{
			dictionary["created"] = created
		}
		if displayTime != nil{
			dictionary["display_time"] = displayTime
		}
		if id != nil{
			dictionary["id"] = id
		}
		if introtext != nil{
			dictionary["introtext"] = introtext
		}
		if isHot != nil{
			dictionary["is_hot"] = isHot
		}
		if linkId != nil{
			dictionary["link_id"] = linkId
		}
		if linkUrl != nil{
			dictionary["link_url"] = linkUrl
		}
		if media != nil{
			dictionary["media"] = media
		}
		if modified != nil{
			dictionary["modified"] = modified
		}
		if ordering != nil{
			dictionary["ordering"] = ordering
		}
		if publishTime != nil{
			dictionary["publish_time"] = publishTime
		}
		if shareCount != nil{
			dictionary["share_count"] = shareCount
		}
		if shortSubject != nil{
			dictionary["short_subject"] = shortSubject
		}
		if snsShare != nil{
			dictionary["snsShare"] = snsShare.toDictionary()
		}
		if source != nil{
			dictionary["source"] = source
		}
		if status != nil{
			dictionary["status"] = status
		}
		if subSubject != nil{
			dictionary["sub_subject"] = subSubject
		}
		if subject != nil{
			dictionary["subject"] = subject
		}
		if tag != nil{
			dictionary["tag"] = tag
		}
		if template != nil{
			dictionary["template"] = template
		}
		return dictionary
	}

}
