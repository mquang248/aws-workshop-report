# Regex-based encoding fix
param([string]$Path = "content")

$files = Get-ChildItem -Path $Path -Recurse -Filter "*_index.vi.md"
$count = 0

foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content
    
    # Use regex to replace patterns
    $content = $content -creplace 'CÃ¡c', 'Các'
    $content = $content -creplace 'cÃ¡c', 'các'
    $content = $content -creplace 'TÃ¬m', 'Tìm'
    $content = $content -creplace 'tÃ¬m', 'tìm'
    $content = $content -creplace 'CÃ´ng', 'Công'
    $content = $content -creplace 'cÃ´ng', 'công'
    $content = $content -creplace 'NgÃ y', 'Ngày'
    $content = $content -creplace 'ngÃ y', 'ngày'
    $content = $content -creplace 'ThÃ nh', 'Thành'
    $content = $content -creplace 'thÃ nh', 'thành'
    $content = $content -creplace 'LÃ ', 'Là'
    $content = $content -creplace 'lÃ ', 'là'
    $content = $content -creplace 'VÃ ', 'Và'
    $content = $content -creplace 'vÃ ', 'và'
    $content = $content -creplace 'CÃ³', 'Có'
    $content = $content -creplace 'cÃ³', 'có'
    $content = $content -creplace 'GÃ¬', 'Gì'
    $content = $content -creplace 'gÃ¬', 'gì'
    $content = $content -creplace 'LÃ m', 'Làm'
    $content = $content -creplace 'lÃ m', 'làm'
    $content = $content -creplace 'CÃ¡ch', 'Cách'
    $content = $content -creplace 'cÃ¡ch', 'cách'
    $content = $content -creplace 'LÆ°u', 'Lưu'
    $content = $content -creplace 'lÆ°u', 'lưu'
    $content = $content -creplace 'BÃ¡o', 'Báo'
    $content = $content -creplace 'bÃ¡o', 'báo'
    $content = $content -creplace 'CÃ¡o', 'Cáo'
    $content = $content -creplace 'cÃ¡o', 'cáo'
    $content = $content -creplace 'NÃ y', 'Này'
    $content = $content -creplace 'nÃ y', 'này'
    $content = $content -creplace 'Tuáº§n', 'Tuần'
    $content = $content -creplace 'tuáº§n', 'tuần'
    $content = $content -creplace 'Thá»©', 'Thứ'
    $content = $content -creplace 'thá»©', 'thứ'
    $content = $content -creplace 'Má»¥c', 'Mục'
    $content = $content -creplace 'má»¥c', 'mục'
    $content = $content -creplace 'TiÃªu', 'Tiêu'
    $content = $content -creplace 'tiÃªu', 'tiêu'
    
    if ($content -ne $original) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
        $count++
    } else {
        Write-Host "  No changes: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "Total files fixed: $count" -ForegroundColor Green
