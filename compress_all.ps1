Add-Type -AssemblyName System.Drawing

$images = Get-ChildItem -Path "assets\images" -Recurse -Include *.png, *.jpg, *.jpeg

foreach ($imgFile in $images) {
    try {
        $img = [System.Drawing.Image]::FromFile($imgFile.FullName)
        
        $isPng = $imgFile.Extension.ToLower() -eq ".png"
        $maxDimension = if ($isPng) { 800 } else { 1920 }
        
        if ($img.Width -gt $maxDimension -or $img.Height -gt $maxDimension) {
            Write-Host "Resizing $($imgFile.Name) (Current: $($img.Width)x$($img.Height))"
            
            $ratio = [math]::Min($maxDimension / $img.Width, $maxDimension / $img.Height)
            $newWidth = [int]($img.Width * $ratio)
            $newHeight = [int]($img.Height * $ratio)
            
            $newImg = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
            $graphics = [System.Drawing.Graphics]::FromImage($newImg)
            $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $graphics.DrawImage($img, 0, 0, $newWidth, $newHeight)
            
            $img.Dispose()
            $graphics.Dispose()
            
            # Save the new image, overwriting the old one
            if ($isPng) {
                $newImg.Save($imgFile.FullName, [System.Drawing.Imaging.ImageFormat]::Png)
            } else {
                # High quality JPEG
                $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
                $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
                $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]85)
                $newImg.Save($imgFile.FullName, $codec, $encoderParams)
            }
            $newImg.Dispose()
            Write-Host "Saved $($imgFile.Name) at $($newWidth)x$($newHeight)"
        } else {
            $img.Dispose()
        }
    } catch {
        Write-Host "Error processing $($imgFile.Name): $($_.Exception.Message)"
    }
}
Write-Host "Image compression finished!"
