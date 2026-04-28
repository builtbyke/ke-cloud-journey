# KE Cloud Journey ☁️

## Purpose
This repository tracks my transition into advanced Cloud Systems Administration. It servers as a [techncial ledger](https://github.com/builtbyke/ke-cloud-journey/blob/main/Milestone%20Journal.md) for my Intune lab, automation scripts, and cloud infrastructure projects.

## Current Lab Hardware (as of 3/7/2026)
- Macbook M1 Pro (Personal Device)
- Lenovo T460 running Win 11 Pro
- Mini PC (ACEMAGICIAN, w/64gb RAM, 2TB SDD, Ryzen 7 5700U running ESXi 8.0.3)
  
**Want to add in the future:**
- Andrioid Device
- Linux Device

## 🛠 Intune Lab Focus
My current focus is mastering **Modern Endpoint Management** with a focus on:
- **Win32 App Packaging:** Custom deployments using the [Intune Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool).
- **Proactive Remediations:** Utilizing PowerShell for self-healing endpoint logic.
- **Automation:** Leveraging Bash and PowerShell to streamline administrative tasks.
- **Zero-Touch Provisioning:** Implementing Windows Autopilot (OOBE) for seamless, hands-off hardware deployments.
- **Endpoint Hardening:** Securing devices using Microsoft Security Baselines, ASR rules, and LAPS.

## 📂 Repository Structure
- **/projects/intune**: Documentation and blueprints for tenant configurations.
- **/scripts/powershell**: Detection, Remediation, and Utility scripts for Windows.
- **/scripts/bash**: Automation scripts for Linux/Unix environments.
- **/configs/hardening**: Security baseline exports and JSON configurations.

## 🛡️ Hardening & Provisioning Specs
* **Autopilot Profile:** User-Driven, Entra Joined, Standard User (No Local Admin).
* **Security Baselines:** Implementation of Microsoft Security Baseline for Windows 11
* **ASR Rules:** Blocking Office child processes and credential stealing from LSASS.
* **Compliance:** Mandatory BitLocker encryption and OS version requirements.
* **LAPS:** Automated local admin password rotation managed via Entra ID.

“There are two different kinds of ninja. Those like you who are born with a natural talent and do not have to work at it. And those like me! The ones that have to train every day of our lives!” - Rock Lee

![Rock Lee image](https://media1.tenor.com/m/abfF-YQ167UAAAAd/rock-lee-weights.gif)

## Socials
[**LinkedIn**](https://www.linkedin.com/in/kijani-evans-423800186/)
