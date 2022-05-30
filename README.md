# vrest-demo
## basic example of call V from R by using json.

### Little-intro abt V
It is compiled and simple syntax more like R. We can compile it with garbage collector OR autofree(soon). It compile very fast with tcc < 1s and binary are so smaller in size compared with c,c++,go,rust.<br>
My server only is 1mb approx and with -prod it is only 701kb size some programmers who make excuses they can't contribute because of low ram labtop they can use v. Unlike tensorflow, torch have huge memory <br>
v's scientific library consume very less memory. You can also do cross compile.

##### 1. First compile & run executable file ./json(linux) and .\json.exe(window)
First you have to install v <a href="https://github.com/vlang/v"> Installation Guide </a> <br>
window = v -cc gcc -gc boehm json.v <br> 
linux = v -gc boehm json.v <br>
mac = v -gc boehm json.v <br>
##### 2.  then call from R
``` {R}
library(httr)
library(jsonlite)


url <- "http://localhost:8080/mean"
#body ex <- '{"data":[4,5,6]}'
l <- list(data = c(1,2,3))
j <- toJSON(l)

# post request
req <- POST(url, body = j, encode = "json")

# response
res <- content(req, type = "text", encoding = "UTF-8")
res <- fromJSON(res)
res$result
```
