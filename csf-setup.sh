#!/bin/bash

echo "🔧 Starting CSF Configuration..."

# 1. Set firewall from test mode to real
sed -i 's/^TESTING = "1"/TESTING = "0"/' /etc/csf/csf.conf
echo "✅ TESTING mode disabled."

# 2. Block countries (e.g. China, India, Brazil)
sed -i 's/^CC_DENY =.*/CC_DENY = "CN,IN,BR"/' /etc/csf/csf.conf
echo "✅ Country blocking set to CN, IN, BR."

# 3. Limit concurrent connections
sed -i 's/^CT_LIMIT =.*/CT_LIMIT = "20"/' /etc/csf/csf.conf
sed -i 's/^CT_BLOCK_TIME =.*/CT_BLOCK_TIME = "3600"/' /etc/csf/csf.conf
echo "✅ CT_LIMIT set to 20, CT_BLOCK_TIME set to 3600 seconds."

# 4. Brute force protection for cPanel/WHM
sed -i 's/^LF_CPANEL =.*/LF_CPANEL = "5"/' /etc/csf/csf.conf
sed -i 's/^LF_WHM =.*/LF_WHM = "5"/' /etc/csf/csf.conf
echo "✅ Brute force protection set for cPanel and WHM (5 attempts)."

# 5. Restart CSF and LFD to apply changes
csf -r
systemctl start csf
systemctl start lfd
echo "🔁 CSF and LFD restarted."

# 6. Enable on boot
systemctl enable csf
systemctl enable lfd
echo "✅ CSF and LFD enabled on boot."

# 7. Manual steps (Allow/Deny IP)
echo ""
echo "📌 Manual steps (optional):"
echo " - Add allowed IPs: nano /etc/csf/csf.allow"
echo " - Add denied IPs: nano /etc/csf/csf.deny"

echo "✅ CSF configuration complete."
