makecert -r -n "CN=DevRoot" -pe -sv DevRoot.pvk -a sha1 -len 2048 -b 01/21/2010 -e 01/21/2030 -cy authority DevRoot.cer
pvk2pfx -pvk DevRoot.pvk -spc DevRoot.cer -pfx DevRoot.pfx
