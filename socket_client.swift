import Foundation

var host = "www.google.com"
var port = "80"

var hints = addrinfo(
    ai_flags: 0,
    ai_family: AF_INET,
    ai_socktype: SOCK_STREAM,
    ai_protocol: 0,
    ai_addrlen: 0,
    ai_canonname: nil,
    ai_addr: nil,
    ai_next: nil
                )
var res = UnsafeMutablePointer<addrinfo>(nil)
var err = getaddrinfo(host, port, &hints, &res)
if (err != 0) {
    let errstr = String.fromCString(gai_strerror(err))!
    print("cannot resolve \(host):\(port): \(errstr)")
    exit(1)
}
var sock = socket(res.memory.ai_family,
                  res.memory.ai_socktype,
                  res.memory.ai_protocol)
if (sock < 0) {
    perror("socket")
    exit(1)
}
err = connect(sock, res.memory.ai_addr, res.memory.ai_addrlen)
if (err < 0) {
    perror("connect to \(host):\(port)")
    exit(1)
}

var req = "GET / HTTP/1.0\r\n\r\n"
var cstr:[CChar] = req.cStringUsingEncoding(NSUTF8StringEncoding)!
var ret = send(sock, cstr, cstr.count, 0)
print("sent \(ret) bytes")

let bufsiz = 1024
var buf = [UInt8](count: bufsiz, repeatedValue: 0)
ret = recv(sock, &buf, bufsiz, 0)
var str = String(bytes: buf, encoding: NSUTF8StringEncoding)!
print(str)

close(sock)
