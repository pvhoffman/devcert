param(
        [string]$Name
)

makecert.exe -iv DevRoot.pvk -ic DevRoot.cer -n "CN=$Name" -pe -sv "$Name.pvk" -a sha1 -len 2048 -b 01/21/2010 -e 01/21/2020 -sky exchange "$Name.cer" -eku 1.3.6.1.5.5.7.3.2
pvk2pfx.exe -pvk "$Name.pvk" -spc "$Name.cer" -pfx "$Name.pfx"
