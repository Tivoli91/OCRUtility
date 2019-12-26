Function Get-Bitmap(){
    [CmdletBinding()]param(
        [string]$image_file,
        [switch]$FromClipboard
    )
	If( $FromClipboard ){
		$bitmap = Get-Clipboard -Format Image # can only be used when powershell versionn > 5
		If( !$bitmap ){ # if there is no image founnd from Clipboard, throw errors
			throw "Not founnd image from Clipboard!"
		}
	}Else{
		$fs = [System.IO.FileStream]::new($image_file,[System.IO.FileMode]::Open,[System.IO.FileAccess]::Read,[System.IO.FileShare]::ReadWrite) # without locking the file
		$bitmap = [System.Drawing.Bitmap]::FromStream($fs)
		$fs.Close() ; $fs.Dispose()
	}
	return $bitmap
}
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUb5fCrmT7KmYqm7vCXO3FL+Uh
# SL6gggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFCUQkXkXKm3X
# IFtX2zZ3Ob7x5M30MA0GCSqGSIb3DQEBAQUABIIBALRkCoy81alM7U+N3UDvSVXl
# bXE5kdC7r4RAXJ5DE7W4/+efVNOj3SjYpCpKevz/0LCQ/niPgJ5IPHnglASMt4zt
# V63LJ0GVX3gA6S24RUeRZ2eMzfENpXjuDZim6d0EiU9EMUiJb2JhMx05SC5oL4Zt
# lWjbfcFdr6kj08rOETkW+mMSLhlfj2IQnSI4lT/eQygy5oEOHAEUqSW35w2wXgyf
# gxCl89IItVQhar+qvZFXsgEzms1O1UjRQwKsuHxm2vVro2C6LLC8v/S85qkcp9gN
# aZX8JHR4i1mlqsvvC2+2KZTMRmm0Rmev8qX5aNkNJIQbumZcJG19XsVi3oc56g4=
# SIG # End signature block
