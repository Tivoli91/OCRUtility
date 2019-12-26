Function New-TrainingData(){
    [CmdletBinding()]param(
        [Parameter(Mandatory=$True)]
        [string]$path
    )
	$cpwd = $pwd
	cd $path
	# reference link https://blog.csdn.net/a745233700/article/details/80175883
	# reference link https://blog.csdn.net/a745233700/article/details/80175883
	# 合并图片到tif
	# 然后基于tif文件生成box文件 an_sn.test.exp0.box
	tesseract.exe anhn.test.exp0.tif anhn.test.exp0 -l eng --psm 7 batch.nochop makebox
	# 手动使用jTessBoxEditor矫正.box文件的错误, 然后保存
	# 生成font_properties文件, "test" in below should be same as in "an_sn.test.exp0.box"
	'test 0 0 0 0 0' |Out-File font_properties -Encoding ascii
	# 使用tesseract生成.tr训练文件
	tesseract anhn.test.exp0.tif anhn.test.exp0 nobatch box.train
	# 生成字符集文件
	unicharset_extractor.exe anhn.test.exp0.box

	# 生成shape文件
	shapeclustering.exe -F font_properties -U unicharset -O anhn.unicharset anhn.test.exp0.tr

	# 生成聚字符特征文件
	mftraining -F font_properties -U unicharset -O anhn.unicharset anhn.test.exp0.tr 


	cntraining.exe anhn.test.exp0.tr 

	ren normproto anhn.normproto 
	ren inttemp anhn.inttemp 
	ren pffmtable anhn.pffmtable 
	ren shapetable anhn.shapetable  

	combine_tessdata.exe anhn. 

	cd $cpwd
}
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUbsqzlzMKZT7tZaQuLVwqSSs/
# maSgggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFMcy0tLfPYUT
# hm3vlrere8jMONlYMA0GCSqGSIb3DQEBAQUABIIBACPfCEMlcxxz03pPKUFLsQ3Z
# tgDFk7BMIEKc1deMYPrpHY8x1tYZsQrO6gQtbFbD4CKk+LUFMxv7ZXWECA4PrI31
# z5kSo7P0g3uQtFXftUzQz2HQVvzsmmy6LqqNN1aEo4zXoDJtc1LHhrL2a2vWuXAU
# Dp8Vu8+H+oyVjiX/znBACL/Ua/PDtiG42o23+NDx2N4Ntnl17/gRoZqAXvdAJaAL
# TLK9c3vPKNEHX10XU9YLQ5xGJTC4Q8bRMYis7rCl2QJgtnsDFW4lk1PVXjTOx1UL
# 8k4ewYZ0MhCGNHX/UoiFz3aYfyVdIxgcpGeTPCLRU3QQFgTcW5sH6fwD8aMPtog=
# SIG # End signature block
