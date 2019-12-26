Function Test-Image {
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param(
		[Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)] 
		[ValidateNotNullOrEmpty()]
		[Alias('PSPath')][string]$Path
	)
	$knownHeaders = @{
		jpg = @( "FF", "D8" );
		bmp = @( "42", "4D" );
		gif = @( "47", "49", "46" );
		tif = @( "49", "49", "2A" );
		png = @( "89", "50", "4E", "47", "0D", "0A", "1A", "0A" );
		pdf = @( "25", "50", "44", "46" );
	}

	# read in the first 8 bits
	$bytes = Get-Content -LiteralPath (ls $Path).fullname -Encoding Byte -ReadCount 1 -TotalCount 8 -ErrorAction Ignore

	$retval = $false
	foreach($key in $knownHeaders.Keys) {

		# make the file header data the same length and format as the known header
		$fileHeader = $bytes | 
			Select-Object -First $knownHeaders[$key].Length | 
			ForEach-Object { $_.ToString("X2") }
		if($fileHeader.Length -eq 0) {
			continue
		}

		# compare the two headers
		$diff = Compare-Object -ReferenceObject $knownHeaders[$key] -DifferenceObject $fileHeader
		if(($diff | Measure-Object).Count -eq 0) {
			$retval = $true
		}
	}
	return $retval
}
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU9B6j3eBlp+e1LL5HSm32R4cG
# ga+gggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFL0XQ6KCXOQq
# dWh6bo6AOf9cO9MEMA0GCSqGSIb3DQEBAQUABIIBAJZrda58Jgv0ub0nsvmgCG3y
# DyHUkXiNFh2mdExlaDwHAPTYf8A5vgpGKAFFGALIMf/7tq/WTJ3aHGOkOFhDXTps
# FX+e43Le0dLzpjilc7Igt+gdXLQG3Nx9ZXQ6b7wvjpqN9QBFcSal0RieZTHmcijD
# 8TZjJpVT5HDqsMT9NcsvlJl6P4IThqkn1b2aXvkNVi4x87+Wk85jX3ScpdPahHz7
# BRBTK8b+H7FNYEg9QLFQ0BUoN+jFciE7kmzPtv31gVjROtbqmLmASJMHfANRregO
# eeKQhMuZeaoA6NCckxjP/IzkCEZcfpxuv0PtbjIRbTMRwQxSX60YaG4aOsH26TY=
# SIG # End signature block
