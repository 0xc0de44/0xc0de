Set args = WScript.Arguments
 
'// you can get url via parameter like line below
Url = args.Item(0)
 
'// Url = "/mypdf.pdf"
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", Url, False
xHttp.Send
 
with bStrm
    .type = 1 '//binary
    .open
    .write xHttp.responseBody
    .savetofile "dl", 2 '//overwrite
end with
