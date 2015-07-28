import Foundation

public class HttpUtil {
    
    public init(){}
    
    public static func request(var strURL:String, instance:AnyObject?) {
        strURL+="?r="+RandomUtil.randomStringWithLength(5)
        self.templateCall(strURL, instance: instance)
    }
    
    public static func request(var strURL:String){
        strURL+="?r="+RandomUtil.randomStringWithLength(5)
        self.templateCall(strURL, instance: nil)
    }
    
    public static func request(baseURL:String, paramData:Dictionary<String, AnyObject>) {
        var param:String = "?"
        for (key, value) in paramData {
            param+=key+"="+(value as! String)+"&"
        }
        param = param.substringWithRange(Range<String.Index>(start: param.startIndex, end: advance(param.endIndex, -1)))
        self.request(baseURL+param)
    }
    
    public static func uploadImage(uploadUrl:String , delegate:AnyObject, picture:NSData, fileName:String){
        let request:NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(fileURLWithPath: uploadUrl)
        request.HTTPMethod = "POST"
        
        let body:NSMutableData = NSMutableData();
        
        let boundary:NSString = "---------------------------14737809831466499882746641449"
        
        var contentType:String = "multipart/form-data; boundary=\(boundary)"
        request.addValue(contentType, forHTTPHeaderField:"Content-type")
        
        //The file to upload
        body.appendData("--%\(boundary)\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!)
        body.appendData("Content-Disposition: form-data; name=\"file\"; filename=\"file.png\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        body.appendData("Content-Disposition: form-data; name=\"img\"; filename=\"\(fileName)\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        body.appendData("Content-Type: application/octet-stream\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        body.appendData(picture)
        body.appendData("\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        body.appendData("Content-Type: application/octet-stream\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        body.appendData("--%\(boundary)--\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
        request.HTTPBody = body
        
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: delegate, startImmediately: true)!
        connection.start()
    }
    
    private static func templateCall(strURL:String, instance:AnyObject?){
        var url: NSURL = NSURL(string: strURL)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: instance, startImmediately: true)!
        connection.start()
    }

}
