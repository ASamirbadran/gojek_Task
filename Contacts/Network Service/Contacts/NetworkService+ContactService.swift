//
//  NetworkService+ContactService.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getContacts(completion: @escaping (
        _ result: Swift.Result<[Contact], NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(ContactService.readContacts)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode([Contact].self, from: response.data)
                        completion(.success(result), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getSpecificContact(url: String, completion: @escaping (
           _ result: Swift.Result<Contact, NetworkError>,
           _ statusCode: StatusCode?
           ) -> Void) {
           
           provider.request(MultiTarget(ContactService.readContactByUrl(url: url))) { (result) in
               switch result {
               case .success(let response):
                   if (200...299 ~= response.statusCode) {
                       do {
                           let result = try JSONDecoder().decode(Contact.self, from: response.data)
                           completion(.success(result), response.statusCode)
                       } catch {
                           completion(.failure(NetworkError.parseError), response.statusCode)
                       }
                   } else {
                       // 300-399 ,400-499
                       do {
                           var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                           businessError.type = .business
                           completion(.failure(businessError), response.statusCode)
                       } catch {
                           completion(.failure(NetworkError.parseError), response.statusCode)
                       }
                   }
                   
               case .failure(let error):
                   let customError = NetworkError(error: error)
                   completion(.failure(customError), nil)
               }
           }
           
       }
    
    func setIsFavorite(
           Id: Int,
           isFavorite: Bool,
           completion: @escaping (
           _ result: Swift.Result<Data, NetworkError>,
           _ statusCode: StatusCode?
           ) -> Void) {
           
        provider.request(MultiTarget(ContactService.favoriteContactById(Id: Id, isFavorite: isFavorite))) { (result) in
               switch result {
               case .success(let response):
                   if (200...299 ~= response.statusCode) {
                    completion(.success(response.data), response.statusCode)
                   } else {
                       // 300-399 ,400-499
                       do {
                           var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                           print(response.data)
                           businessError.type = .business
                           completion(.failure(businessError), response.statusCode)
                       } catch {
                           completion(.failure(NetworkError.parseError), response.statusCode)
                       }
                   }
                   
               case .failure(let error):
                   let customError = NetworkError(error: error)
                   completion(.failure(customError), nil)
               }
           }
           
       }
    
    func editContact(
        contact: ContactViewModel,
        completion: @escaping (
        _ result: Swift.Result<Data, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
     provider.request(MultiTarget(ContactService.editContactById(modifiedContact: contact))) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                 completion(.success(response.data), response.statusCode)
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        let validation = try JSONDecoder().decode(apiError.self, from: response.data)
                        print(response.data)
                        businessError.type = .business
                        businessError.message = validation.errors?.joined( separator: "\n")
                        businessError.code
                            = response.statusCode
                        
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func addContact(
        contact: Contact,
        completion: @escaping (
        _ result: Swift.Result<Data, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
     provider.request(MultiTarget(ContactService.addContact(contact: contact))) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                 completion(.success(response.data), response.statusCode)
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        let validation = try JSONDecoder().decode(apiError.self, from: response.data)
                        print(response.data)
                        businessError.type = .business
                        businessError.message = validation.errors?.joined( separator: "\n")
                        businessError.code
                            = response.statusCode
                        
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    
}
