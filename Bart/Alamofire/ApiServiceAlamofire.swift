import SWXMLHash
import Alamofire

enum ModelError: ErrorType {
  case BadXML(XMLIndexer)
}

public protocol XMLSerializable {
  init(node: XMLIndexer) throws
}

extension Alamofire.Request {

    public func responseObjectForKeyPath<T:XMLSerializable>(keyPath: String, completionHandler: Response<T, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<T, NSError> { request, response, data, error in
            guard error == nil else {
                return .Failure(error!)
            }

            guard let data = data else {
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: "Received empty response")
                return .Failure(error)
            }

            do {
                let xml = SWXMLHash.parse(data)
                let modelXML = try xml.byKey(keyPath)
                let model = try T(node: modelXML)
                return .Success(model)
            } catch let error {
                return .Failure(error as NSError)
            }
        }

        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }

  public func responseArrayForKeyPath<T:XMLSerializable>(keyPath: String, completionHandler: Response<[T], NSError> -> Void) -> Self {
    let responseSerializer = ResponseSerializer<[T], NSError> { request, response, data, error in
        guard error == nil else {
            return .Failure(error!)
        }

        guard let data = data else {
            let error = Error.errorWithCode(.DataSerializationFailed, failureReason: "Received empty response")
            return .Failure(error)
        }

        do {

            let xml = SWXMLHash.parse(data)
            let collection = keyPath
                .characters
                .split { $0 == "." }
                .map(String.init)
                .reduce(xml) { (xmlPath, subKey) in
                    return xmlPath[subKey]
            }

            let models = try collection.all.map { modelXML in
                try T(node: modelXML)
            }

            return .Success(models)
        } catch {
            return .Failure(error as NSError)
        }
    }

    return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
  }
}
