Function New-CropImage(){
    [CmdletBinding()]param(
        [int]$to_left_distance,
        [int]$to_top_distance,
        [int]$image_width,
        [int]$image_height,
		[ValidateScript({test-path $_})]
        [string]$img_file="$($env:TEMP)\ocr.jpg",
		[string]$new_img_file=$img_file
    )
	$bitmap = Get-Bitmap $img_file
	If( $to_left_distance -gt $bitmap.Width -or $to_top_distance -gt $bitmap.Height -or $image_width -gt $bitmap.Width -or $image_height -gt $bitmap.Height -or (($to_left_distance + $image_width) -gt $bitmap.Width -or (($to_top_distance + $image_height) -gt $bitmap.Height)) ){
		$bitmap
		write-host "To be croped size not inside source image size"
		write-host "$to_left_distance,$to_top_distance,$image_width,$image_height"
		return
	}
	$rect = [System.Drawing.Rectangle]::new($to_left_distance,$to_top_distance,$image_width,$image_height)
	($bitmap.Clone($rect,$bitmap.PixelFormat)).Save($new_img_file,[System.Drawing.Imaging.ImageFormat]::Png) 
}


# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUoYewhXyL+oIT5VVulJUjSp44
# hqmgggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFJDIyo7Y3TA7
# 6eCaBSnrqOjOIhKWMA0GCSqGSIb3DQEBAQUABIIBAGF0HL7aZrt0JZ5iQtD2HMZL
# zqDEzLU0/kJH85BkCvqoawSf8MoxjKIgfHTnbiOXO4G97h/1LgkaoEinKNZoaZWJ
# 9vQZtXruHtqoUWZ/1YW3YLk6c+lzWay9y3APHS5kATrtUDN6R0wfKxN00pDKXWOn
# PLQE54/u2NjfNJIMsQKTnGxolvPEDsssiHX4z0SzD+RngvX/zCpy1O6TcBQczxcH
# n+3WF8Gc52HXo8SzDmzcRRmDUtnUU6jZC1rCtEki24OH3dJX+oFHDkLhM+BGeNym
# 9r8DNvprTsf0ghWic2sLUhjP5JN4E8CYlP7hQjViavyKhaFHW10Bihhki4VYJN4=
# SIG # End signature block
