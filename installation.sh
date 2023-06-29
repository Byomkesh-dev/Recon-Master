#!/bin/bash

echo "give me a bottle of rum!"
#!/bin/bash

# Function to check the operating system
check_os() {
    echo "Checking operating system..."

    if [ "$(uname)" == "Linux" ]; then
        check_linux_distribution
    elif [ "$(uname)" == "Darwin" ]; then
        install_mac_programs
    elif [ "$(uname)" == "Windows" ]; then
        install_windows_programs
    else
        echo "Unsupported operating system. Please install the programs manually."
        exit 1
    fi
}

# Function to check the Linux distribution
check_linux_distribution() {
    echo "Checking Linux distribution..."

    if [ -f /etc/os-release ]; then
        # Source the OS release file
        . /etc/os-release

        # Check for Debian or Ubuntu
        if [ "$ID" == "debian" ] || [ "$ID" == "ubuntu" ]; then
            install_debian_programs
        fi

        # Check for Arch Linux
        if [ "$ID" == "arch" ]; then
            install_arch_programs
        fi

        # Check for Red Hat or CentOS
        if [ "$ID" == "rhel" ] || [ "$ID" == "centos" ]; then
            install_redhat_programs
        fi
    else
        echo "Unsupported distribution. Please install the programs manually."
        exit 1
    fi
}

# Function to install programs for Debian or Ubuntu
install_debian_programs() {
    echo "Detected Debian or Ubuntu distribution. Installing necessary programs..."

    # Install dirsearch
    git clone https://github.com/maurosoria/dirsearch.git
    cd dirsearch
    pip3 install -r requirements.txt
    cd ..

    # Install subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

    # Install nikto
    apt-get update
    apt-get install -y nikto

    # Install wappalyzer
    npm install -g wappalyzer-cli

    # Install wkhtmltoimage
    apt-get install -y wkhtmltopdf

    # Install whatweb
    gem install whatweb

    # Install wpscan
    gem install wpscan

    echo "Installation completed."
}

# Function to install programs for Arch Linux
install_arch_programs() {
    echo "Detected Arch Linux distribution. Installing necessary programs..."

    # Install dirsearch
    git clone https://github.com/maurosoria/dirsearch.git
    cd dirsearch
    pip3 install -r requirements.txt
    cd ..

    # Install subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

    # Install nikto
    pacman -Syu --noconfirm nikto

    # Install wappalyzer
    npm install -g wappalyzer-cli

    # Install wkhtmltoimage
    pacman -Syu --noconfirm wkhtmltopdf

    # Install whatweb
    gem install whatweb

    # Install wpscan
    gem install wpscan

    echo "Installation completed."
}

# Function to install programs for Red Hat or CentOS
install_redhat_programs() {
    echo "Detected Red Hat or CentOS distribution. Installing necessary programs..."

    # Install dirsearch
    git clone https://github.com/maurosoria/dirsearch.git
    cd dirsearch
    pip3 install -r requirements.txt
    cd ..

    # Install subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

    # Install nikto
    yum install -y nikto

    # Install wappalyzer
    npm install -g wappalyzer-cli

    # Install wkhtmltoimage
    yum install -y wkhtmltopdf

    # Install whatweb
    gem install whatweb

    # Install wpscan
    gem install wpscan

    echo "Installation completed."
}

# Function to install programs for macOS
install_mac_programs() {
    echo "Detected macOS. Installing necessary programs..."

    # Install dirsearch
    git clone https://github.com/maurosoria/dirsearch.git
    cd dirsearch
    pip3 install -r requirements.txt
    cd ..

    # Install subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

    # Install nikto
    brew install nikto

    # Install wappalyzer
    npm install -g wappalyzer-cli

    # Install wkhtmltoimage
    brew install wkhtmltopdf

    # Install whatweb
    gem install whatweb

    # Install wpscan
    gem install wpscan

    echo "Installation completed."
}

# Function to install programs for Windows
install_windows_programs() {
    echo "Detected Windows. Please manually install the necessary programs:"

    echo "- dirsearch: https://github.com/maurosoria/dirsearch"
    echo "- subfinder: https://github.com/projectdiscovery/subfinder"
    echo "- nikto: https://cirt.net/nikto2"
    echo "- wappalyzer-cli: https://www.npmjs.com/package/wappalyzer-cli"
    echo "- wkhtmltopdf: https://wkhtmltopdf.org/downloads.html"
    echo "- whatweb: https://www.morningstarsecurity.com/research/whatweb"
    echo "- wpscan: https://wpscan.com"

    echo "Please ensure the programs are accessible from the command line."

    echo "Installation completed."
}

# Main script
echo "Welcome to Recon Tool Installer!"
echo "This script will install the necessary programs used in Recon Tool."

check_os

echo "Programs installed successfully."
