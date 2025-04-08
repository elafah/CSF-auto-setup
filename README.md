# 🔐 CSF Auto Configuration Script

This bash script automates the initial setup and hardening of CSF (ConfigServer Security & Firewall) on your Linux server.

## ✅ Features

- Disables test mode
- Blocks specific countries (CN, IN, BR)
- Limits concurrent connections (CT_LIMIT = 20)
- Enables brute force protection for cPanel & WHM
- Ensures CSF & LFD start on boot
- Provides notes for manually allowing/denying IPs

## 📦 Usage

```bash
chmod +x csf-setup.sh
sudo ./csf-setup.sh
```

## 📁 Manual Steps

After running the script, you can:

- Add allowed IPs:  
  `nano /etc/csf/csf.allow`
  
- Add denied IPs:  
  `nano /etc/csf/csf.deny`

## 📝 Note

This script is for educational/demo purposes. Always test on a staging server before applying to production.

---

Created with ❤️ by Ela
