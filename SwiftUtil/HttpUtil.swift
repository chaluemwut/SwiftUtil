import Foundation

public class HttpUtil {
    
    public init(){}
    
    public static func request(strURL:String, instance:AnyObject) {
        self.templateCall(strURL, instance: instance)
    }
    
    public static func request(strURL:String){
        self.templateCall(strURL, instance: nil)
    }
    
    private static func templateCall(strURL:String, instance:AnyObject?){
        var url: NSURL = NSURL(string: strURL)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: instance, startImmediately: true)!
        connection.start()
    }
}
