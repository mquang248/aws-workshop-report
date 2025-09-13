import os
import re

def remove_warnings_from_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Pattern for Vietnamese warning
        vi_pattern = r'<div class="notices warning">.*?Lưu ý.*?không sao chép nguyên văn.*?</div>'
        
        # Pattern for English warning  
        en_pattern = r'<div class="notices warning">.*?Note.*?reference purposes only.*?</div>'
        
        # Pattern for any warning div
        any_warning_pattern = r'<div class="notices warning">.*?</div>'
        
        # Remove Vietnamese warnings
        content = re.sub(vi_pattern, '', content, flags=re.MULTILINE | re.DOTALL)
        
        # Remove English warnings
        content = re.sub(en_pattern, '', content, flags=re.MULTILINE | re.DOTALL)
        
        # Remove any remaining warning divs
        content = re.sub(any_warning_pattern, '', content, flags=re.MULTILINE | re.DOTALL)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        return True
    except Exception as e:
        print(f'Error processing {file_path}: {e}')
        return False

# Process all HTML files
processed = 0
total = 0

for root, dirs, files in os.walk('.'):
    # Skip public directory
    if 'public' in root:
        continue
    for file in files:
        if file.endswith('.html'):
            total += 1
            file_path = os.path.join(root, file)
            if remove_warnings_from_file(file_path):
                processed += 1

print(f'✅ Processed {processed}/{total} HTML files')
print(f'✅ All warning banners have been removed!')
