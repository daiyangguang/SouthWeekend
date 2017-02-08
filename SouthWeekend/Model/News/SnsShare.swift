//
//	SnsShare.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SnsShare{

	var qqweibo : String!
	var sina : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		qqweibo = dictionary["qqweibo"] as? String
		sina = dictionary["sina"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if qqweibo != nil{
			dictionary["qqweibo"] = qqweibo
		}
		if sina != nil{
			dictionary["sina"] = sina
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}