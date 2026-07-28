const fs = require('fs');
try {
  const blog = fs.readFileSync('blog.html', 'utf8');
  const navMatch = blog.match(/<nav id="navbar"[\s\S]*?<\/nav>/);
  if (!navMatch) {
    console.log("Nav not found in blog.html");
    process.exit(1);
  }
  const nav = navMatch[0];
  
  const files = ['index.html', 'hackability.html', 'hatch.html', 'partners.html'];
  for (const file of files) {
    if (fs.existsSync(file)) {
      const content = fs.readFileSync(file, 'utf8');
      const newContent = content.replace(/<nav id="navbar"[\s\S]*?<\/nav>/, nav);
      if (newContent !== content) {
        fs.writeFileSync(file, newContent);
        console.log(`Updated ${file}`);
      }
    }
  }
} catch(err) {
  console.error(err);
}
