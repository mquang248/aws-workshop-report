# Simple encoding fix script
param([string]$Path = "content")

$files = Get-ChildItem -Path $Path -Recurse -Filter "*_index.vi.md"
$count = 0

foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content
    
    # Most common replacements
    $content = $content.Replace('Ã¡', 'á')
    $content = $content.Replace('Ã ', 'à')  
    $content = $content.Replace('Ã¢', 'â')
    $content = $content.Replace('Ã£', 'ã')
    $content = $content.Replace('Ã©', 'é')
    $content = $content.Replace('Ã¨', 'è')
    $content = $content.Replace('Ãª', 'ê')
    $content = $content.Replace('Ã­', 'í')
    $content = $content.Replace('Ã¬', 'ì')
    $content = $content.Replace('Ã³', 'ó')
    $content = $content.Replace('Ã²', 'ò')
    $content = $content.Replace('Ã´', 'ô')
    $content = $content.Replace('Ãµ', 'õ')
    $content = $content.Replace('Ãº', 'ú')
    $content = $content.Replace('Ã¹', 'ù')
    $content = $content.Replace('Ã½', 'ý')
    
    # Common words
    $content = $content.Replace('CÃ¡c', 'Các')
    $content = $content.Replace('cÃ¡c', 'các')
    $content = $content.Replace('TÃ¬m', 'Tìm')
    $content = $content.Replace('tÃ¬m', 'tìm')
    $content = $content.Replace('CÃ´ng', 'Công')
    $content = $content.Replace('cÃ´ng', 'công')
    $content = $content.Replace('NgÃ y', 'Ngày')
    $content = $content.Replace('ngÃ y', 'ngày')
    $content = $content.Replace('ThÃ nh', 'Thành')
    $content = $content.Replace('thÃ nh', 'thành')
    $content = $content.Replace('LÃ ', 'Là')
    $content = $content.Replace('lÃ ', 'là')
    $content = $content.Replace('VÃ ', 'Và')
    $content = $content.Replace('vÃ ', 'và')
    $content = $content.Replace('CÃ³', 'Có')
    $content = $content.Replace('cÃ³', 'có')
    $content = $content.Replace('GÃ¬', 'Gì')
    $content = $content.Replace('gÃ¬', 'gì')
    $content = $content.Replace('LÃ m', 'Làm')
    $content = $content.Replace('lÃ m', 'làm')
    $content = $content.Replace('CÃ¡ch', 'Cách')
    $content = $content.Replace('cÃ¡ch', 'cách')
    $content = $content.Replace('LÆ°u', 'Lưu')
    $content = $content.Replace('lÆ°u', 'lưu')
    $content = $content.Replace('BÃ¡o', 'Báo')
    $content = $content.Replace('bÃ¡o', 'báo')
    $content = $content.Replace('CÃ¡o', 'Cáo')
    $content = $content.Replace('cÃ¡o', 'cáo')
    $content = $content.Replace('NÃ y', 'Này')
    $content = $content.Replace('nÃ y', 'này')
    
    if ($content -ne $original) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
        $count++
    } else {
        Write-Host "  No changes: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "Total files fixed: $count" -ForegroundColor Green
