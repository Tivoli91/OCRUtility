# 判断tesseract有没有添加到环境变量里
$found_tesseract_in_env_path=$false
$env:Path.split(';') | %{
	If(test-path "$_\tesseract.exe" ){
		Add-Type -AssemblyName System.Windows.Forms
		Add-type -AssemblyName System.Drawing
		ls "$PSScriptRoot\*.ps1" -Exclude "Install-ThisModule.ps1"|%{. $_.fullname}
		$found_tesseract_in_env_path=$true
		return
	}
}
If( !$found_tesseract_in_env_path ){
	write-error "The tesseract.exe program is not found in the environment path. Please add it to the environment path before using this module."
}
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUMaH0J1stQuXa9DQIb8denvfY
# mkugggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
# MCAxHjAcBgNVBAMTFUNoYW95dWVQb3dlclNoZWxsQ2VydDAeFw0xOTEyMDYxMzU4
# NThaFw0zOTEyMzEyMzU5NTlaMCAxHjAcBgNVBAMTFUNoYW95dWVQb3dlclNoZWxs
# Q2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALlP3thT4yCaCium
# ZZ53Li0hxYTXhxg8BjT6UC6tgjVXjbcbJmlLRql/hBxZDjkv9lgZY+XUX9TmYQ/A
# 4EgpYn5cb0uCleO1dk13gH45dgAg5bww+jsT4ano50ByHZ+HX+YAlrSo4nIFTqPx
# UBIck2ubEmS6i5b5BUAZQ1MeFl5BkqPUvBf/FJMDxdM1vz2DHLDwlExCufl44uF3
# 2z8UNis47Pnv3C2bXZkRiIbXD5JcVldc2UJ3tZ0b4DYuZ2XDh3y/1SHqKRQ9XVa4
# j7hhfkwYyE70422KDCR6eOCCMO5CClh7f1ulv25Ma5uNMdkwDKW4kQPp/6p55llv
# 60zABqECAwEAAaNqMGgwEwYDVR0lBAwwCgYIKwYBBQUHAwMwUQYDVR0BBEowSIAQ
# FgxXCr5ViLVCwfteKwzKaaEiMCAxHjAcBgNVBAMTFUNoYW95dWVQb3dlclNoZWxs
# Q2VydIIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUAA4IBAQBB3+Taarp2Kqsw
# 9XLJbp+Zni8xAwVsep28hL1pq/kQzkiJySh++b2eaYi3AKqWGd4OjAIyASBYWRp9
# rVMW1nSJZ6ajGmbJZRXZ3hd4TUoCX/DjrniT0Gqr8OvybbWNczM4NFfEBkKbzvz0
# aK582qRtoKG7uEYVaRr+SSWoxzVVIhZn1sAMK4Vx0HDmg0mq9R/QL8/vHEbYPWAj
# GoiTgjZYDjjEe1TxwBmF69AB4/87MZgnZNYbSGUCxFHy66Owj07X96pm5ORoUyTT
# ZXk2djKijlCXdnulEchOzSf/xPyp/AQaUB9LNbqfXYJMbWFSxGPfIMHMbUGrR7Az
# RljwtDPBMYIB1TCCAdECAQEwNDAgMR4wHAYDVQQDExVDaGFveXVlUG93ZXJTaGVs
# bENlcnQCEOZxM0xOujSwT6C2MRvhNwMwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcC
# AQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYB
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFOseeqvIGbd0
# WgU5EPQ/XT+K4rOSMA0GCSqGSIb3DQEBAQUABIIBAFk+uImGkQ4zD29RPTvq3evq
# h9xzLJ27do3BHO3sgcPfai4JexD/Ns7cY3+sJe01h4Kst9e1TQZFG/hnz0YS1f9i
# 08+uD/bbUauTvfw3+PndyJnua1aSN4zLo7dz7C8YlNvGaRk3erYSZMKuHAB9M4Cf
# 5VD+PwQ2saq+JdwQDB7ntCyBepe7MnFoT3P0t98m3IL6wZcyLUN23swJVL1s/xSL
# AblNpbNrc4AM8/X5D12aJyf2f8NyiVeHNol0tm1LmbMSHTshm5dzDuSJr/Y/ZYx2
# pRXnQHsKhiF33OpQ/jNSFDgMhMiAYHCnNePplL7NB6yRSo8iz2hnjsvvZc0edyg=
# SIG # End signature block
