Function Test-OCRWord($check_image,$training_data,$check_data){
	tesseract.exe $check_image "$($env:TEMP)\ocrword" --psm 7 -l $training_data 2>$null # ans anh eng chi_sim
	If( (((cat "$($env:TEMP)\ocrword.txt" -Encoding UTF8).ToCharArray()|%{[int]$_}) -join "") -inotmatch "$check_data" ){ # 因为中文编码的问题, 所以我这里验证全转为ASCII码来验证的
		return $false
	}else{
		return $true
	}
}
<#
'26597304752084421578' 查看公告
'36134214953164929702' 账号管理
'28857209872084037096'  点击全部 收获
'328562999220505368732015412' "聘用候选人" --> 开始招募干员
'28857209873904621462' 点击领取
'3253438431' 编队
'202502345823460' 会客室
3574621333201322018412 订单交付
#>
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUMIjxqMc3rYAsu8vHn+9wlE76
# SHmgggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFKdtmrTQCPHp
# YcYMyElgaCYpwEmFMA0GCSqGSIb3DQEBAQUABIIBACv3v++meT6Q6KBramqsOb+K
# CHMm2gp1ik9mM8wLVX0EKR5JeyDCYbNiSfr6TkDvyWVQQBy6qW+zm+j5bQX/Anx7
# 47VLvxPqVoLgOhSA9I3kf+r7o4qWPc67fynMTBEhNq1V+VHzzQmDkwDatfKVg3ub
# M2HUhBrCoZEnir6lfOolbHu5I1Uy1k20VNR0tSio5bKM6SGijdtCkId716FqUIy0
# eX1XMRthp4/vgqZkxABc1dNXoQkyX3Y4M21HWRIDd0trSUkDNWG6TTquHw893KP3
# fm2KZMhlu/02q4CEnEBz1WTBE6bbfYSuTTMYd0QQ2HYPxygRNCHmoIaiYy45C+8=
# SIG # End signature block
