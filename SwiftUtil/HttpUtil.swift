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
    
    private static func templateCall(strURL:String, instance:AnyObject?){
        var url: NSURL = NSURL(string: strURL)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: instance, startImmediately: true)!
        connection.start()
    }

}
