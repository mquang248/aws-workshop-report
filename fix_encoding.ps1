# Simple PowerShell script to fix Vietnamese encoding
param([string]$FolderPath = "content")

$files = Get-ChildItem -Path $FolderPath -Recurse -Filter "*_index.vi.md"
$totalFixed = 0

foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)" -ForegroundColor Yellow
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content
    
    # Basic replacements for most common errors
    $content = $content -replace 'Ã¡', 'á'
    $content = $content -replace 'Ã ', 'à'
    $content = $content -replace 'Ã¢', 'â'
    $content = $content -replace 'Ã£', 'ã'
    $content = $content -replace 'Ã©', 'é'
    $content = $content -replace 'Ã¨', 'è'
    $content = $content -replace 'Ãª', 'ê'
    $content = $content -replace 'Ã­', 'í'
    $content = $content -replace 'Ã¬', 'ì'
    $content = $content -replace 'Ã³', 'ó'
    $content = $content -replace 'Ã²', 'ò'
    $content = $content -replace 'Ã´', 'ô'
    $content = $content -replace 'Ãµ', 'õ'
    $content = $content -replace 'Ãº', 'ú'
    $content = $content -replace 'Ã¹', 'ù'
    $content = $content -replace 'Ã½', 'ý'
    $content = $content -replace 'Ä', 'ă'
    $content = $content -replace 'Æ¡', 'ơ'
    $content = $content -replace 'Æ°', 'ư'
    $content = $content -replace 'Ä''', 'đ'
    
    # Common word patterns
    $content = $content -replace 'CÃ¡c', 'Các'
    $content = $content -replace 'cÃ¡c', 'các'
    $content = $content -replace 'TÃ¬m', 'Tìm'
    $content = $content -replace 'tÃ¬m', 'tìm'
    $content = $content -replace 'CÃ´ng', 'Công'
    $content = $content -replace 'cÃ´ng', 'công'
    $content = $content -replace 'NgÃ y', 'Ngày'
    $content = $content -replace 'ngÃ y', 'ngày'
    $content = $content -replace 'Má»¥c', 'Mục'
    $content = $content -replace 'má»¥c', 'mục'
    $content = $content -replace 'TiÃªu', 'Tiêu'
    $content = $content -replace 'tiÃªu', 'tiêu'
    $content = $content -replace 'Káº¿t', 'Kết'
    $content = $content -replace 'káº¿t', 'kết'
    $content = $content -replace 'Quáº£', 'Quả'
    $content = $content -replace 'quáº£', 'quả'
    $content = $content -replace 'Triá»ƒn', 'Triển'
    $content = $content -replace 'triá»ƒn', 'triển'
    $content = $content -replace 'Cáº§n', 'Cần'
    $content = $content -replace 'cáº§n', 'cần'
    $content = $content -replace 'Thá»±c', 'Thực'
    $content = $content -replace 'thá»±c', 'thực'
    $content = $content -replace 'Táº­p', 'Tập'
    $content = $content -replace 'táº­p', 'tập'
    $content = $content -replace 'ThÃ nh', 'Thành'
    $content = $content -replace 'thÃ nh', 'thành'
    $content = $content -replace 'LÃ ', 'Là'
    $content = $content -replace 'lÃ ', 'là'
    $content = $content -replace 'VÃ ', 'Và'
    $content = $content -replace 'vÃ ', 'và'
    $content = $content -replace 'CÃ³', 'Có'
    $content = $content -replace 'cÃ³', 'có'
    $content = $content -replace 'GÃ¬', 'Gì'
    $content = $content -replace 'gÃ¬', 'gì'
    $content = $content -replace 'Náº¯m', 'Nắm'
    $content = $content -replace 'náº¯m', 'nắm'
    $content = $content -replace 'NhÃ³m', 'Nhóm'
    $content = $content -replace 'nhÃ³m', 'nhóm'
    $content = $content -replace 'CÆ¡', 'Cơ'
    $content = $content -replace 'cÆ¡', 'cơ'
    $content = $content -replace 'Báº£n', 'Bản'
    $content = $content -replace 'báº£n', 'bản'
    $content = $content -replace 'Táº¡o', 'Tạo'
    $content = $content -replace 'táº¡o', 'tạo'
    $content = $content -replace 'Cáº¥u', 'Cấu'
    $content = $content -replace 'cáº¥u', 'cấu'
    $content = $content -replace 'HÃ¬nh', 'Hình'
    $content = $content -replace 'hÃ¬nh', 'hình'
    $content = $content -replace 'LÃ m', 'Làm'
    $content = $content -replace 'lÃ m', 'làm'
    $content = $content -replace 'Vá»›i', 'Với'
    $content = $content -replace 'vá»›i', 'với'
    $content = $content -replace 'Biáº¿t', 'Biết'
    $content = $content -replace 'biáº¿t', 'biết'
    $content = $content -replace 'CÃ¡ch', 'Cách'
    $content = $content -replace 'cÃ¡ch', 'cách'
    $content = $content -replace 'Sá»­', 'Sử'
    $content = $content -replace 'sá»­', 'sử'
    $content = $content -replace 'LÆ°u', 'Lưu'
    $content = $content -replace 'lÆ°u', 'lưu'
    $content = $content -replace 'BÃ¡o', 'Báo'
    $content = $content -replace 'bÃ¡o', 'báo'
    $content = $content -replace 'CÃ¡o', 'Cáo'
    $content = $content -replace 'cÃ¡o', 'cáo'
    $content = $content -replace 'Tuáº§n', 'Tuần'
    $content = $content -replace 'tuáº§n', 'tuần'
    $content = $content -replace 'Thá»©', 'Thứ'
    $content = $content -replace 'thá»©', 'thứ'
    $content = $content -replace 'NÃ y', 'Này'
    $content = $content -replace 'nÃ y', 'này'
    
    # Special characters
    $content = $content -replace 'âš ï¸', '⚠️'
    $content = $content -replace 'â€"', '–'
    
    if ($content -ne $original) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  Fixed encoding in $($file.Name)" -ForegroundColor Green
        $totalFixed++
    } else {
        Write-Host "  No changes needed for $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "`nCompleted! Fixed $totalFixed files." -ForegroundColor Green
