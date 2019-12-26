Function Convert-Image(){
    [CmdletBinding()]param(
		# load from provided bitmap class
		[Parameter(Mandatory=$True,ParameterSetName='Stream')]
		[System.Drawing.Bitmap]$bitmap,
		# load from image file and then connvert it to bitmap class, there is validation to check if the given file is really an image file
		[Parameter(Mandatory=$True,ParameterSetName='File')]
		[ValidateScript({Test-Image $_})]
        [string]$source_image_file,
		# load from clipbord when you use some tools to take screenshot
		[Parameter(Mandatory=$True,ParameterSetName='Clipboard')]
		[switch]$FromClipboard,
		# the full file name to save new image if you want to save the new image file
		[string]$out_image_file,
		# how would you like to handle the image
		[ValidateSet("ToGrey","Reverse","Binarize")]
		[string]$action = "ToGrey",
		# this switch is only used for "Binarize" for which method will be used
		[switch]$UseAverage,
		# use give threshold for "Binarize"
		[ValidateScript({$_ -in @(0..255)})]
		[int]$BinarizeThreshold,
		# do not save to file but directly get the new image bitmap class for other function use to avoid duplicated IO actionns
		[switch]$ReturnBitmapObject
    )
	
	#region pre-handle bitmap class
	If( $FromClipboard ){
		$bitmap = Get-Clipboard -Format Image # can only be used when powershell versionn > 5
		If( !$bitmap ){ # if there is no image founnd from Clipboard, throw errors
			throw "Not founnd image from Clipboard!"
		}
	}
	If( $pscmdlet.ParameterSetName -eq "File"){ # load from file
		$bitmap = Get-Bitmap $source_image_file
	}
	#endregion

	#region Start to take related actions
	Switch($action){
	    "ToGrey"{
			# Traverse every pixel of the image
			For( $i=0; $i -lt $bitmap.Width; $i++ ){
				For( $j=0; $j -lt $bitmap.Height; $j++ ){
					# get the RGB value of current pixel
					$color = $bitmap.GetPixel($i,$j)
					# calculate the grey value of current pixel
					$grey = [int]($color.R * 0.3 + $color.G * 0.59 + $color.B * 0.11)
					# create a new color with all grey value for RGB
					$new_color = [System.Drawing.Color]::FromArgb($grey, $grey, $grey)
					# reset current pixel color to the new grey color
					$bitmap.SetPixel($i, $j, $new_color)
				}
			}
			break
		}
	    "Reverse"{
			For( $i=0; $i -lt $bitmap.Width; $i++ ){
				For( $j=0; $j -lt $bitmap.Height; $j++ ){
					# get the RGB value of current pixel
					$color = $bitmap.GetPixel($i,$j)
					# create a new color with all reversed value for RGB
					$new_color = [System.Drawing.Color]::FromArgb(255-$color.R, 255-$color.G, 255-$color.B)
					# reset current pixel color to the new grey color
					$bitmap.SetPixel($i, $j, $new_color)
				}
			}
			break
		}
	    "Binarize"{
			# you must make sure the image you send to this function is greyscaled, I will try to find some method to automatically checek this in the future
			If( $UseAverage ){
				# Method 1 --> use given 
				# take the average gray level of the picture as the threshold, all of which are lower than 0, and all of the values above the value are 255.
				# 1.1 get average
				$average = 0
				For( $i=0; $i -lt $bitmap.Width; $i++ ){
					For( $j=0; $j -lt $bitmap.Height; $j++ ){
						# get the RGB value of current pixel
						$color = $bitmap.GetPixel($i,$j)
						$average += $color.B  # as r,g,b are all same, so use anyone of theem is ok
					}
				}
				$average = [int]($average / ($bitmap.Width * $bitmap.Height))
			}Else{
				$average = $BinarizeThreshold
			}
			# 1.2 start to binarize pixel
			For( $i=0; $i -lt $bitmap.Width; $i++ ){
				For( $j=0; $j -lt $bitmap.Height; $j++ ){
					$color = $bitmap.GetPixel($i,$j)
					# "$i,$j,$($color.B)" | Out-File -FilePath D:\temp\ocr\test.txt -Append -Encoding utf8 -Force
					
					$r,$g,$b = Switch((255 - $color.B) -gt $average){
						{$_ -eq $true}{0,0,0 ;break}
						default{255,255,255}
					}
					$bitmap.SetPixel($i, $j, ([System.Drawing.Color]::FromArgb($r,$g,$b)))
				}
			}
		}
	}
	#endregion
	
	#region how to handle result
	If( $ReturnBitmapObject ){
		return $bitmap
	}else{
		If( !$PSBoundParameters.ContainsKey('out_image_file' ) ){
			If( $pscmdlet.ParameterSetName -imatch "Stream|Clipboard" ){
				throw "Not provided the file name of paramter 'out_image_file' to save new image!"
			}
			# when no out image file path provided, we use the source_image_file name & append grey to it
			$extension = [System.IO.Path]::GetExtension($source_image_file)
			$out_image_file = (ls $source_image_file).fullname + "-$action$extension"
		}
		# it will automatically overwrite the existing file if it's not been used at the same time when we run the function
		$bitmap.Save($out_image_file,[System.Drawing.Imaging.ImageFormat]::Jpeg)
	}
	#endregion
}
# SIG # Begin signature block
# MIIFmwYJKoZIhvcNAQcCoIIFjDCCBYgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUHEawdpiYkt/t4Z57yFxtl2+G
# ndygggMwMIIDLDCCAhigAwIBAgIQ5nEzTE66NLBPoLYxG+E3AzAJBgUrDgMCHQUA
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFCVuV1E0mcmx
# ZQff98b2lL8WOKmcMA0GCSqGSIb3DQEBAQUABIIBAKqGGyetkEci9PMBnyf7hv2n
# vlP7h6nfAiAFLYfNdg2lrdr9ApW3cZYXoLP4cvzC1ONCIol1ivlt3rrQdBsYQeEn
# +kZp1giPlIYBnpLkVooFzd+2Tt0fTr4HokqKnVkdiPmkc+mU+KtWkgDYUDn0MSCT
# CQMlJeYFsts/CDY4O/fmBCESBZa00eZJnYd9qu4RB2N4JPip1j9w44uTxKjAeKtJ
# FZOhyYQ/P+BawuAfkNFYrrr4qxRn8JEJrWf+zMPDeXkB+3Age5daqdv7viKr8Vf3
# u/b1HJaSH82os1ifgT+UArz4yJSGHo0ntW5KpS+XWapaMpwOO2aIls7eVAFi4cw=
# SIG # End signature block
