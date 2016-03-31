param(
        [string]$Name
)

makecert -iv DevRoot.pvk -ic DevRoot.cer -n "CN=$Name" -pe -sv "$Name.pvk" -a sha1 -len 2048 -b 01/21/2010 -e 01/21/2020 -sky exchange "$Name.cer" -eku 1.3.6.1.5.5.7.3.1
pvk2pfx -pvk "$Name.pvk" -spc "$Name.cer" -pfx "$Name.pfx"
