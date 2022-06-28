1. Run the following command from termminal to show total views

$ ruby -r "./lib/checker.rb" -e "Checker.new('webserver.log').views('total')"

You will get the following desired output

"==========================================="
"List of webpages with views in ordered form"
"==========================================="
"/about/2  90 visits"
"/contact  89 visits"
"/index  82 visits"
"/about  81 visits"
"/help_page/1  80 visits"
"/home  78 visits"

2. Run the following command from terinal to show uniq views

$ ruby -r "./lib/checker.rb" -e "Checker.new('webserver.log').views('uniq')"

You will get the following desired output

"================================================"
"List of webpages with uniq views in ordered form"
"================================================"
"/index  23 visits"
"/home  23 visits"
"/contact  23 visits"
"/help_page/1  23 visits"
"/about/2  22 visits"
"/about  21 visits"

Please run bin/rspec for test cases
