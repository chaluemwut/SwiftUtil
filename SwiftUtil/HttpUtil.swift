import Foundation

public class HttpUtil {
    
    public init(){
        
    }
    
    public static func aysn(strURL:String, instance:AnyObject) {
        var url: NSURL = NSURL(string: strURL)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: instance, startImmediately: true)!
        connection.start()
    }
}
