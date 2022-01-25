$net = new-object -ComObject WScript.Network
$net.MapNetworkDrive("Z:", "\\csb10032001ac4ca573.file.core.windows.net\cs-ront-sela-co-il-10032001ac4ca573", $true, "localhost\csb10032001ac4ca573", "ylFV8nVbCX9bOxqZxFbc3CP7P9uSlP7COfJtazi6/MIOUBOMMQPV9fcmZ1SsqRDX+aDdmPAFgsmU4UTxaDC2zg==")
New-Item -Path 'Z:\newfilePacker.txt' -ItemType File