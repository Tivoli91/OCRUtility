Function New-ScreenShot(){
    [CmdletBinding()]param(
        [int]$image_width,
        [int]$image_height,
        [int]$to_left_distance,
        [int]$to_top_distance,
		[string]$image_file
    )
	Try{
		# Create bitmap using the top-left and bottom-right bounds
		$bitmap = [System.Drawing.Bitmap]::new($image_width, $image_height)
		# Create Graphics object
		$graphic = [System.Drawing.Graphics]::FromImage($bitmap)
		# Capture screen
		$graphic.CopyFromScreen($to_left_distance, $to_top_distance, 0, 0, $bitmap.Size)
		# Save to file
		$bitmap.Save($image_file,[System.Drawing.Imaging.ImageFormat]::Jpeg) 
	}Catch{
		throw $_
	}Finally{
	}
}

# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUXjFx3pYUQl4EiF3aAyCA/WZI
# O72gggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFBwlj+xsQRUl
# zoIpXGjvSalo4pQgMA0GCSqGSIb3DQEBAQUABIIBAEIB1OxbX5t1rKbGMDd+wxJ4
# swoWSC8LwVOj1c4r9E2rETQSKcQktoC0jyW5oNrXc9mH4skTgG9QQbZ6yPez+ym0
# ZXyv7zEyZyVSr99glH8UYu+ksmNFazY3T9YN8xC+rjEAcPrQixKh6m01l+DlPYsQ
# votHF1U6GhXy9AADANGRQ/Jp7hDkOrfUNOPDO6hcYQAbwAv31FpFlx7FE0PU/khs
# uoGxX5qImDR4KmoBW0eWCSjtYIcRK6S06TuonBYNW2aV2tV2T8Sg39AGAXHHEU51
# jpk7JBx6gOU3K+YRDW6U9YIWib8QTXvvAKaqkkXtxZ9GV0QhxBsu8VQVDVd40vk=
# SIG # End signature block
