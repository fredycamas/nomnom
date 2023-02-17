//
//  BusinessNetworking.swift
//  nomnom
//
//  Created by Life on 2/9/23.
//

import Foundation

protocol BusinessManagmentDelegate{
    func didUpdateBusiness(businessData: [BusinessCardModel])
}

struct BusinessManagment {
    
    let baseURL = "https://api.yelp.com/v3/businesses/search"
    let apikey = "WY4lMzv9JU2f7uS8DEORj7aMG-3XLOHTXVR1tk1ZPqvY6Mehp5QjSInLLUNn-bit9226-LPmZAxDTk6iHka8uLTEvlk2M3tfgna6_s0kl1k-WnR3Ifo5_ZRNd1uTY3Yx"
    
    var delegate:BusinessManagmentDelegate?
    
    func fetchData(latitude: Double,
                   longitude: Double,
                   category: String,
                   limit: Int,
                   sortBy: String,
                   locale: String,
                   completionHandler: @escaping ([BusinessCardModel]?, Error?) -> Void) {
        
        let businessURL = "\(baseURL)?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"
        performRequest(businessURL:businessURL)
        
    }
    
    func performRequest(businessURL:String){
       
        guard  let url = URL(string: businessURL) else {return}
          
        
       
       var request = URLRequest(url: url)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            
            if error == nil{
                
            }
            
            if let newData = data {
                
               //let dataString = String(data: newData, encoding: .utf8)
                //print(dataString)
                if let businessCard =  self.parseJSON(businessData: newData){
                    delegate?.didUpdateBusiness(businessData: businessCard)
                }
                
                
               
            }
           
        }
        task.resume()
    }
    
    func parseJSON(businessData: Data) -> [BusinessCardModel]?{
       
        let decoder = JSONDecoder()
        var businessContainer: [BusinessCardModel] = []
        
        do{
            let decoderData = try decoder.decode(BusinessData.self, from: businessData)
           
            print(decoderData)
           
            for business in decoderData.businesses{
                
                print(business)
                let id = business.id ?? "\(UUID())"
                let name = business.name ?? "Coming Soon"
                let rating = business.rating ?? 0.0
                let price = business.price ?? "unkown"
                let open = business.is_closed  ?? true
                let address = business.location?.display_address ?? []
                let url = business.image_url ?? ""
             
                let longitude = String(format: "%.2f", business.coordinates?.longitude ?? 0.0)
                let latitude = String(format: "%.2f", business.coordinates?.latitude ?? 0.0)

                let customCard = BusinessCardModel(id: id, name: name, rating: rating, price: price, open: open, address: address, urlImage: url,longitude: longitude, latitude: latitude)

                businessContainer.append(customCard)
            }
            
            return businessContainer
            
            
        }catch {
            print(error)
            return nil
          
        }
    }
}



/////
/////do {
//
///// Read data as JSON
//let json = try JSONSerialization.jsonObject(with: data!, options: [])
//
///// Main dictionary
//guard let resp = json as? NSDictionary else { return }
//
///// Businesses
//guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else { return }
//
//var venuesList: [BusinessData] = []
//
///// Accessing each business
//for business in businesses {
//    var venue = BusinessData()
//    venue.name = business.value(forKey: "name") as? String
//    venue.id = business.value(forKey: "id") as? String
//    venue.rating = business.value(forKey: "rating") as? Float
//    venue.price = business.value(forKey: "price") as? String
//    venue.is_closed = business.value(forKey: "is_closed") as? Bool
//    venue.distance = business.value(forKey: "distance") as? Double
//    venue.latitude = business.value(forKey: "latitude") as? Double
//
//    let address = business.value(forKeyPath: "location.display_address") as? [String]
//    venue.address = address?.joined(separator: "\n")
//
//    venuesList.append(venue)
//}
//
//
//
//} catch {
//print("Caught error")
//
//}
//}.resume()
