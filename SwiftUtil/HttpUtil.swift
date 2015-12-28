import Foundation

public class HttpUtil {
    
    public init(){}
    
    public static func requestSync(strURL:String){
        let request = NSURLRequest(URL: NSURL(string: strURL)!)
        var response:NSURLResponse?
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            print(data)
            // Parse the data
        } catch {
            // handle error
            print(error)
        }
    }
    
    public static func requestWithCache(strURL:String, instance:AnyObject?) {
        self.templateCall(strURL, instance: instance)
    }
    
    public static func request(var strURL:String, instance:AnyObject?) {
        strURL=strURL+"&r="+RandomUtil.randomStringWithLength(5)
        self.templateCall(strURL, instance: instance)
    }

    public static func requestNoParameter(var strURL:String, instance:AnyObject?) {
        strURL=strURL+"?r="+RandomUtil.randomStringWithLength(5)
        self.templateCall(strURL, instance: instance)
    }
    
    public static func request(var strURL:String){
        strURL=strURL+"&r="+RandomUtil.randomStringWithLength(5)
        self.templateCall(strURL, instance: nil)
    }
    
    public static func request(baseURL:String, paramData:Dictionary<String, AnyObject>) {
        var param:String = "?"
        for (key, value) in paramData {
            param+=key+"="+(value as! String)+"&"
        }
        param = param.substringWithRange(Range<String.Index>(start: param.startIndex, end: param.endIndex.advancedBy(-1)))
        self.request(baseURL+param)
    }
    
    public static func uploadImage(uploadUrl:String , delegate:AnyObject, picture:NSData, fileName:String){
        // create url request to send
        let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: uploadUrl)!)
        mutableURLRequest.HTTPMethod = "POST"
        let boundaryConstant = "myRandomBoundary12345";
        let contentType = "multipart/form-data;boundary="+boundaryConstant
        mutableURLRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        
        
        // create upload data to send
        let uploadData = NSMutableData()
        
        // add image
        uploadData.appendData("\r\n--\(boundaryConstant)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        uploadData.appendData("Content-Disposition: form-data; name=\"img\"; filename=\"\(fileName)\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        uploadData.appendData("Content-Type: image/png\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        uploadData.appendData(picture)
        
        uploadData.appendData("\r\n--\(boundaryConstant)--\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        mutableURLRequest.HTTPBody = uploadData
        
        let connection:NSURLConnection = NSURLConnection(request: mutableURLRequest, delegate: delegate, startImmediately: true)!
        connection.start()
    }
    
    private static func templateCall(strURL:String, instance:AnyObject?){
        print(strURL)
        let endcodeURL:String = strURL.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let url: NSURL = NSURL(string: endcodeURL)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: instance, startImmediately: true)!
        connection.start()
    }

}
