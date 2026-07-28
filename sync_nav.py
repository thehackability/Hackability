import os
import re

# Read the source nav
with open('blog.html', 'r', encoding='utf-8') as f:
    blog_content = f.read()

# Extract from <nav id="navbar" ...> to </nav>
nav_match = re.search(r'(<nav id="navbar".*?</nav>)', blog_content, flags=re.DOTALL)
if not nav_match:
    print("Could not find nav in blog.html")
    exit(1)
    
source_nav = nav_match.group(1)

html_files = ['hackability.html', 'hatch.html', 'index.html', 'partners.html']

for filename in html_files:
    if os.path.exists(filename):
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Replace the target nav
        new_content = re.sub(r'<nav id="navbar".*?</nav>', lambda _: source_nav, content, flags=re.DOTALL)
        
        if new_content != content:
            with open(filename, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated {filename}")
        else:
            print(f"No changes for {filename}")
