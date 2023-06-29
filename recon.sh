#!/bin/bash
# Function to perform DNS dump
perform_dns_dump() {
    echo "[*]Performing DNS dump..."
     echo "Dumping DNS records for $domain..."
    dig $domain +nocmd any +multiline +noall +answer > dns_dump.txt
    echo "DNS dump completed. Results saved to dns_dump.txt."
}


# Function to perform DNS enumeration
perform_dns_enum() {
    echo "[*]Performing DNS enumeration for $domain..."
    nslookup $domain > dns_enum_output.txt
    echo "DNS enumeration completed. Results saved to dns_enum_output.txt."
}

# Function to perform port scanning
perform_port_scan() {
    echo "[*]Performing port scanning for $domain..."
    nmap -T4 -A -p- $domain > port_scan_output.txt
    echo "Port scanning completed. Results saved to port_scan_output.txt."
}

# Function to perform WHOIS lookup
perform_whois_lookup() {
    echo "[*]Performing WHOIS lookup for $domain..."
    whois $domain > whois_output.txt
    echo "WHOIS lookup completed. Results saved to whois_output.txt."
}

# Function to perform subdomain enumeration
perform_subdomain_enum() {
    echo "[*]Performing subdomain enumeration for $domain..."
    subfinder -d $domain > subdomain_enum_output.txt
    echo "Subdomain enumeration completed. Results saved to subdomain_enum_output.txt."
}

# Function to perform directory enumeration
perform_dir_enum() {
    echo "[*]Performing directory enumeration for $domain..."
    dirsearch -u $domain -e php,html,js -t 50 -o dir_enum_output.txt
    echo "Directory enumeration completed. Results saved to dir_enum_output.txt."
}

# Function to perform vulnerability assessment
perform_vulnerability_assessment() {
    echo "[*]Performing vulnerability assessment for $domain..."
    nikto -h $domain -o vuln_assessment_output.txt
    echo "Vulnerability assessment completed. Results saved to vuln_assessment_output.txt."
}

# Function to detect web technologies
detect_web_technologies() {
    echo "[*]Detecting web technologies for $domain..."
    wappalyzer $domain > web_technologies_output.txt
    echo "Web technologies detection completed. Results saved to web_technologies_output.txt."
}

# Function to perform NSLOOKUP
perform_nslookup() {
    echo "[*]Performing NSLOOKUP for $domain..."
    nslookup $domain > nslookup_output.txt
    echo "NSLOOKUP completed. Results saved to nslookup_output.txt."
}

# Function to perform reverse IP lookup
perform_reverse_ip_lookup() {
    echo "[*]Performing reverse IP lookup for $domain..."
    host $domain > reverse_ip_lookup_output.txt
    echo "Reverse IP lookup completed. Results saved to reverse_ip_lookup_output.txt."
}

# Function to perform honeypot detection
perform_honeypot_detection() {
    echo "Performing honeypot detection for $domain..."
    honeytrap -d $domain > honeypot_detection_output.txt
    echo "Honeypot detection completed. Results saved to honeypot_detection_output.txt."
}

# Function to perform endpoint detection
perform_endpoint_detection() {
    echo "Performing endpoint detection for $domain..."
    curl -I $domain > endpoint_detection_output.txt
    echo "Endpoint detection completed. Results saved to endpoint_detection_output.txt."
}

# Function to perform CMS detection
perform_cms_detection() {
    echo "Performing CMS detection for $domain..."
    whatweb $domain > cms_detection_output.txt
    echo "CMS detection completed. Results saved to cms_detection_output.txt."
}

# Function to perform firewall detection
perform_firewall_detection() {
    echo "[*]Performing firewall detection for $domain..."
    curl -I $domain > firewall_detection_output.txt
    echo "Firewall detection completed. Results saved to firewall_detection_output.txt."
}

# Function to perform SSL and TLS certificate detection
perform_ssl_tls_detection() {
    echo "[*]Performing SSL and TLS certificate detection for $domain..."
    openssl s_client -connect $domain:443 </dev/null 2>/dev/null | openssl x509 -text > ssl_tls_detection_output.txt
    echo "SSL and TLS certificate detection completed. Results saved to ssl_tls_detection_output.txt."
}

# Function to take a screenshot of the webpage
take_webpage_screenshot() {
    echo "[*]Taking a screenshot of $domain..."
    wkhtmltoimage --quiet --width 1280 --height 720 $domain > screenshot.png
    echo "Screenshot captured. Saved as screenshot.png."
}

# Function to perform web template scanning
perform_web_template_scan() {
    echo "[*]Performing web template scan for $domain..."
    wpscan --url $domain -o web_template_scan_output.txt
    echo "Web template scan completed. Results saved to web_template_scan_output.txt."
}

# Function to generate the HTML report
generate_html_report() {
    cat <<EOF > recon_report.html
<!DOCTYPE html>
<html>
<head>
    <title>Recon Report for $domain</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    h1 {
      color: #333;
      margin-bottom: 20px;
    }
    h2 {
      color: #666;
      margin-top: 30px;
    }
    pre {
      background-color: #f5f5f5;
      padding: 10px;
      border-radius: 5px;
      overflow: auto;
    }
    img {
      max-width: 800px;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <h1>Recon Report for $domain</h1>

<h2>DNS Dump Results</h2>
  <pre>$(cat dns_dump.txt)</pre>

  <h2>DNS Enumeration Results</h2>
  <pre>$(cat dns_enum_output.txt)</pre>

  <h2>Port Scanning Results</h2>
  <pre>$(cat port_scan_output.txt)</pre>

  <h2>WHOIS Lookup Results</h2>
  <pre>$(cat whois_output.txt)</pre>

  <h2>Subdomain Enumeration Results</h2>
  <pre>$(cat subdomain_enum_output.txt)</pre>

  <h2>Directory Enumeration Results</h2>
  <pre>$(cat dir_enum_output.txt)</pre>

  <h2>Vulnerability Assessment Results</h2>
  <pre>$(cat vuln_assessment_output.txt)</pre>

  <h2>Web Technologies Detection Results</h2>
  <pre>$(cat web_technologies_output.txt)</pre>

  <h2>NSLOOKUP Results</h2>
  <pre>$(cat nslookup_output.txt)</pre>

  <h2>Reverse IP Lookup Results</h2>
  <pre>$(cat reverse_ip_lookup_output.txt)</pre>

  <h2>Honeypot Detection Results</h2>
  <pre>$(cat honeypot_detection_output.txt)</pre>

  <h2>Endpoint Detection Results</h2>
  <pre>$(cat endpoint_detection_output.txt)</pre>

  <h2>CMS Detection Results</h2>
  <pre>$(cat cms_detection_output.txt)</pre>

  <h2>Firewall Detection Results</h2>
  <pre>$(cat firewall_detection_output.txt)</pre>

  <h2>SSL and TLS Certificate Detection Results</h2>
  <pre>$(cat ssl_tls_detection_output.txt)</pre>

  <h2>Screenshot</h2>
  <img src="screenshot.png" alt="Webpage Screenshot">

  <h2>Web Template Scan Results</h2>
  <pre>$(cat web_template_scan_output.txt)</pre>
</body>
</html>
EOF
    echo "HTML report generated. Check recon_report.html for the results."
}

# Main menu
echo "Recon Master"

# Read the domain from the user
read -p "Enter the domain: " domain

echo "1. Perform DNS dump"  
echo "2. Perform DNS enumeration"
echo "3. Perform port scanning"
echo "4. Perform WHOIS lookup"
echo "5. Perform subdomain enumeration"
echo "6. Perform directory enumeration"
echo "7. Perform vulnerability assessment"
echo "8. Detect web technologies"
echo "9. Perform NSLOOKUP"
echo "10. Perform Reverse IP lookup"
echo "11. Perform honeypot detection"
echo "12. Perform endpoint detection"
echo "13. Perform CMS detection"
echo "14. Perform firewall detection"
echo "15. Perform SSL and TLS certificate detection"
echo "16. Take a screenshot of the webpage"
echo "17. Perform web template scan"
echo "18. Generate HTML report"
echo "19. Perform all operations"
echo "99. Quit"

read -p "Enter your choice(s) (comma-separated): " choices

IFS=',' read -ra selected_choices <<< "$choices"

for choice in "${selected_choices[@]}"; do
    case $choice in

        1)  
            perform_dns_dump
            ;;
        2)
            perform_dns_enum
            ;;
        3)
            perform_port_scan
            ;;
        4)
            perform_whois_lookup
            ;;
        5)
            perform_subdomain_enum
            ;;
        6)
            perform_dir_enum
            ;;
        7)
            perform_vulnerability_assessment
            ;;
        8)
            detect_web_technologies
            ;;
        9)
            perform_nslookup
            ;;
        10)
            perform_reverse_ip_lookup
            ;;
        11)
            perform_honeypot_detection
            ;;
        12)
            perform_endpoint_detection
            ;;
        13)
            perform_cms_detection
            ;;
        14)
            perform_firewall_detection
            ;;
        15)
            perform_ssl_tls_detection
            ;;
        16)
            take_webpage_screenshot
            ;;
        17)
            perform_web_template_scan
            ;;
        18)
            generate_html_report
            ;;
        19)
            perform_dns_dump 
            perform_dns_enum
            perform_port_scan
            perform_whois_lookup
            perform_subdomain_enum
            perform_dir_enum
            perform_vulnerability_assessment
            detect_web_technologies
            perform_nslookup
            perform_reverse_ip_lookup
            perform_honeypot_detection
            perform_endpoint_detection
            perform_cms_detection
            perform_firewall_detection
            perform_ssl_tls_detection
            take_webpage_screenshot
            perform_web_template_scan
            generate_html_report
            ;;
        99)
            echo "Quitting..."
            exit 0
            ;;
        *)
            echo "Invalid choice: $choice"
            ;;
    esac
done
