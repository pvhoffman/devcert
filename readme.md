###Create SSL Certificates for a Windows Development Environment###
1.  Create the root certificate 
    1.  Execute from cmd shell `powershell -executionpolicy bypass -command "& .\CreateDevRoot.ps1`
    2.  Select 'None' for password unless the private key requires a password.
    3.  Directory should now contain DevRoot.cer, DevRoot.pfx, and DevRoot.pvk
2.  Create the SSL certificate
    1.  Execute from cmd shell `powershell -executionpolicy bypass -command "& .\CreateSSLCert.ps1 -Name <site name>"` where <site name> is the name of the website, e.g. web.local.
    2.  Enter the password for the private key is specified in step 1.2
    3.  Directory should now contain <site name>.pvk, <site name>.cer, and <site name>.pfx
3.  Using the mmc certificate snap-in import the DevRoot.cer, created in step 1, into the Trusted Root Certification Authorities folder of the certificate store for the local computer.
4.  Using the mmc certificate snap-in import the <site name>.pfx, created in step 2, into the Personal folder of the certificate store for the local computer.
5.  If using IIS: In IIS Manger select the bindings for the desired web site and associate the certificate created in step 2 for use with HTTPS.
6.  Edit c:\windows\system32\drivers\etc\hosts and add new line:  `127.0.0.1 <site name>`
7.  If using IIS 8 or newer specify the host name for the site if multiple websites and certificates are to be used in development environment. 
8.  If using self-hosting use `netsh http add urlacl` and `netsh http add sslcert` to set permissions for listener and certificate to use for SSL.

