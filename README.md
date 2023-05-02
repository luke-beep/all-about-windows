# **An in-depth guide on optimizations for windows**
<div align="center">
	<br />
	<p>
		<a href="#"><img src="./assets/win.png" width="540" alt="Windows Logo" /></a>
	</p>
	<br />
	<p>
		<a href="https://discord.gg/ndjNzKCmff"><img src="https://img.shields.io/badge/discord-join-blue?style=flat-square&logo=discord" alt="My Discord server" /></a>
		<a href="https://github.com/luke-beep"><img src="https://img.shields.io/badge/github-view-blue?style=flat-square&logo=github" alt="My Github profile" /></a>
        <a href="https://www.youtube.com/channel/UC_-YAH9OBLVVWom_wV4HHxw"><img src="https://img.shields.io/badge/youtube-view-blue?style=flat-square&logo=youtube" alt="My Youtub Channel"></a>
    </p>
</div>





**Date last updated:** 3 April 2023

**Winver:** 22H2 (to check winver version do WIN + R and type "winver" and press enter.)

**Note:** This guide is for windows 10 64-bit and 11 64-bit. If you are using windows 7 or 8, you can use this guide but some of the steps may not work. It is advised to make a backup of your computer before doing any of the steps in this guide. Here is a guide on how to **[create a system restore point](https://support.microsoft.com/en-us/windows/create-a-system-restore-point-77e02e2a-3298-c869-9974-ef5658ea3be9)**. If you feel like anything is missing or needs to be changed, feel free to make a pull request or open an issue.

**Disclaimer:** I am not responsible for any damage done to your computer. This guide is for educational purposes only.

This guide is essentially a collection of tweaks and fixes. Some are by others, some are by me. If you want to use this guide, please link to this github.

### **Table of Contents**

- [**General Tweaks**](#general-tweaks)
  - [**System Tweaks**](#system-tweaks)
- [**Service Tweaks**](#service-tweaks)
- [**Gaming Tweaks**](#gaming-tweaks)
- [**Network Tweaks**](#network-tweaks)
- [**Optional Tweaks**](#optional-tweaks)
- [**Visual Tweaks**](#visual-tweaks)
- [**BIOS Tweaks**](#bios-tweaks)
- [**Driver Tweaks**](#driver-tweaks)
- [**Programming Tools**](#programming-tools)
- [**Gaming Configs**](#gaming-configs)
- [**Credits and Useful Links**](#credits-and-useful-links)


### **General Tweaks**

---

1. Uninstall all unnecessary apps.

2. Make sure that you have the latest version of windows. As of current date it would be 22H2. 

3. Download this program **[https://github.com/hellzerg/optimizer/releases](https://github.com/hellzerg/optimizer/releases)** and continue following the guide.

<img src="./assets/optimizer.png" alt="Optimizer" title="Optimizer">

For example, if you would like to keep print service on then you do not tick "Disable Print Service".

4. Disable all the unnecessary startup apps. To do this you want to go and open up Task Manager. Go to the Startup tab and disable all the apps that you do not use.

5. To complete this process you may need to go into regedit and the delete some startup keys from there, or you could use **[https://github.com/hellzerg/optimizer/releases](https://github.com/hellzerg/optimizer/releases)** and simply go to the Startup tab and select all the apps that you do not use and delete them.

Select startup apps.
<img src="./assets/tab1.png" alt="Optimizer" title="Optimizer">
Select all the apps that you do not use.


<img src="./assets/tab2.png" alt="Optimizer" title="Optimizer">
Click delete.

<img src="./assets/tab3.png" alt="Optimizer" title="Optimizer">
When you recieve the popup to delete all the selected startup items click yes. This deletes all the registry keys for the startup apps that you do not use.
 
<img src="./assets/tab4.png" alt="Optimizer" title="Optimizer">

6. Run Windows Disk Cleanup. WIN + R and type "cleanmgr.exe", then press enter. Choose your drive and press **OK**. Then select what you would like to clean up and hit **OK**.

8. Run Windows Defragment and trimmer. WIN + R and type "dfrgui.exe", then press enter. Select your drive and press Optimize or Analyze.

9. Change energy plan. Open control panel and search for power plan. Then select **show additional plans** and select **Ultimate Performance**. 

10. Run SystemPropertiesAdvanced in WIN + R. Then hit settings for performance. Then select **Adjust for best performance**.

11. If you have external drives open up SystemPropertiesAdvanced and go to settings for Performance. Then go to advanced and under virtual memory select **No paging file**. This will disable the paging file on your external drives. **Do not do this on your main drive.**

12. Enable everything in System > Monitor > Graphics Settings > Default Graphics Settings. This will make your computer run smoother.

13. Disable Storage Sense.

14. WIN + R and type "msconfig". Then go to the Services tab and disable all the services that you do not use. Then go to the Boot tab and open up advanced options for your boot drive. Go back to the Boot tab and change your timeout to 5 seconds for a mid-high end computer. 10 seconds for a low-mid end computer. And 20 seconds for a laptop.

15. Open an elevated command prompt and type "bcdedit /set increaseuserva 3072" and press enter. This will increase the amount of virtual memory that your computer can use. This will help with performance and crashes if you have a 32 bit system. **Do not do this on a 64 bit system.**

16. Open an elevated command prompt and type slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX. Then set a KMS server by typing slmgr /skms kms8.msguides.com. Then activate windows by typing slmgr /ato. This will activate windows and make it enable all the features and remove the ugly watermark. Run slmgr /xpr to check if it worked.



### **Service Tweaks**

---

**Disclaimers for this section specifically:** Do not, and I repeat do NOT disable any service that you don't know what it does. If you do not know what a service does, then google it. If you disable a service that is required for your computer to run, unexpected errors might popup. I am not responsible for any damage done to your computer. This guide is for educational purposes only.

1. To begin with this section, you have to open up services.msc. To do this you can either WIN + R and type "services.msc" or you can open up task manager and go to the services tab and click on "Open Services" at the bottom of the window. Or by simply searching for services in the start menu.

2. Identify the unnecessary services: Look through the list of services and identify those that you don't need. You can use google to identify services that's unnecessary and that can be safely disabled.

3. Disable unnecessary services, to disable a service, right-click on it and select "Properties". In the "Startup type" drop-down menu, select "Disabled". Click "Apply" and then "OK" to save your changes. Repeat this step for any other unnecessary services.

4. Restart your computer: Once you've made changes to the services, it's a good idea to restart your computer to ensure that the changes take effect instantly.

Optimizing Windows services can help improve your computer's performance by reducing unnecessary resource usage and delta cycles. However, it's important to be extra careful when disabling services, as some services are required for important things. If you disable a service that's required for your computer to run, unexpected errors might popup. So, make sure to only disable services that you don't need.

### **Gaming Tweaks**

---

1. Disable hardware acceleration on everything, your browser, discord etc. This will increase performance by a lot. 

2. Disable all ingame overlays. This will increase performance by a lot.


**[Process Lasso](https://bitsum.com/)** is an advanced process priority optimization and system automation utility.

**[https://www.msi.com/Landing/afterburner/graphics-cards](https://www.msi.com/Landing/afterburner/graphics-cards)** is a graphics card overclocking utility.

**[https://www.guru3d.com/files-details/display-driver-uninstaller-download.html](https://www.guru3d.com/files-details/display-driver-uninstaller-download.html)** is a display driver uninstaller which you can bundle up with NVCleanstall to debloat your graphics card drivers **[https://www.techpowerup.com/nvcleanstall/](https://www.techpowerup.com/nvcleanstall/)**.

**[https://www.techpowerup.com/download/techpowerup-gpu-z/](https://www.techpowerup.com/download/techpowerup-gpu-z/)** is a graphics card information utility.

**[https://www.techpowerup.com/download/cpu-z/](https://www.techpowerup.com/download/cpu-z/) or [https://www.cpuid.com/softwares/cpu-z.html](https://www.cpuid.com/softwares/cpu-z.html)**  is a freeware that gathers information on some of the main devices of your system.

### **Network Tweaks**

---

**Cloudflare IPv4 DNS Servers:**

1.1.1.1 and 1.0.0.1

**Cloudflare IPv6 DNS Servers:**

2606:4700::1111 and 2606:4700:4700::1001

**Google IPv4 DNS Servers:**

 8.8.8.8 and 8.8.4.4
 
**Google IPv6 DNS Servers:**

2001:4860:4860::8888 and 2001:4860:4860::8844

**Quad9 IPv4 DNS Servers:**

9.9.9.9 and 149.112.112.112

**Quad9 IPv6 DNS Servers:**

2620:fe::fe and 2620:fe::9

**Good to know IPConfig commands:**

ipconfig /flushdns - Flushes the DNS cache.

ipconfig /Displaydns - Shows information about your current DNS server.

ipconfig /Registerdns - Initiates manual dynamic registration for the DNS names and IP addresses that are configured at a computer.

ipconfig /release - Releases the IPv4 address that you are currently using.

ipconfig /release6 - Releases the IPv6 address that you are currently using.

ipconfig /renew - Renews an IPv4 address on your device.

ipconfig /renew6 - Renews an IPv6 address on your device.

ipconfig /all - Displays all the information about all your current network adapters.

ipconfig /? - Help for IPConfig.

**Generally good to know commands**

netsh => /? -  A powerful command for configuring network adapters.

netstat - Displaying Network Statistics.

net - View different parts of your network.

nslookup - Useful for diagnosing DNS name resolution problems.

hostname -  Identify your current hostname.

arp - Modify & Display the Address Resolution Protocol cache.

getmac - Displays your current MAC address.

systeminfo - Information about your device.

pathping - Combines Ping & Tracert.

tracert - Trace packets to a destination.


**Bandwidth Measurement:**

Mb - Megabit

MB - Megabyte

Mbps - Megabit per second.

MBps - Megabyte per second.

b - bit

B - byte


**https://1.1.1.1/**

**https://developers.google.com/speed/public-dns/docs/using**

**https://www.quad9.net/service/service-addresses-and-features**

**https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ipconfig**


### **Optional Tweaks**

---

WPD is a privacy tool **[https://wpd.app/](https://wpd.app/)**. It is a free and open source tool that allows you to disable telemetry and other privacy invasive features in Windows 10 and 11. It is recommended to use this tool if you are concerned about your privacy.

**[https://www.bleachbit.org/](https://www.bleachbit.org/)** is a disk cleaner for windows. **Recommended**

**[https://www.oo-software.com/en/shutup10/update](https://www.oo-software.com/en/shutup10/update)** an antispy tool for windows 10 and 11.

**[https://www.speedguide.net/downloads.php](https://www.speedguide.net/downloads.php)**. This is a tool that will help you optimize your internet connection. It's called TCP Optimizer. You would want to download version 4.0.14. It's the latest version.

**[https://github.com/auraside/HoneCtrl](https://github.com/auraside/HoneCtrl)** a windows bat script. Aimed to optimize your computer for general use and gaming. 

A windows tool that allows you to achive maximum productivity **[https://github.com/microsoft/PowerToys](https://github.com/microsoft/PowerToys)**. **Recommended**

**[https://www.malwarebytes.com/solutions/rootkit-scanner](https://www.malwarebytes.com/solutions/rootkit-scanner)** a rootkit scanner. **Recommended**

**[https://www.malwarebytes.com/solutions/malware-scanner](https://www.malwarebytes.com/solutions/malware-scanner)** a malware scanner. **Recommended**

**[https://github.com/builtbybel/ThisIsWin11](https://github.com/builtbybel/ThisIsWin11)** a windows 11 tweaker, only available for windows 11. **Recommended**


### **Visual Tweaks**

---

A tool that allows for customization of Win32 apps. **[https://github.com/MicaForEveryone/MicaForEveryone](https://github.com/MicaForEveryone/MicaForEveryone)**. **Only Available for Windows 11**

**[https://www.startallback.com/](https://www.startallback.com/)** a tool that allows you to change the start menu. **Only Available for Windows 11**

**[https://startisback.com/](https://startisback.com/)** a tool that allows you to change the start menu. **Only Available for Windows 10**


### **BIOS Tweaks**

---
**Note: Only disable those that you do not need! If you disable something that you need, something might break.**



 **For those who are using an Intel CPU, you can disable the following:**



1. Disable Intel SpeedStep. This will disable the CPU from going into a low power state. This will increase performance.
2. Disable Intel VT-x. This will disable the CPU from using an old Virtualization technology. This will increase performance.

 **For those who are using a Ryzen CPU, you can disable the following:**

 

1. Disable AMD Cool'n'Quiet. This will disable the CPU from going into a low power state. This will increase performance.
2. Disable AMD C1E. This will disable the CPU from going into a low power state. This will increase performance.



 **For those who are using an Nvidia GPU, you can disable the following:**

 

1. Disable Nvidia Adaptive V-Sync. This will disable the GPU from using Adaptive V-Sync. This will increase performance.
2. Disable Nvidia Ansel. This will disable the GPU from using Ansel. This will increase performance.
3. Disable Nvidia Ambient Occlusion. This will disable the GPU from using Ambient Occlusion. This will increase performance.
4. Disable Nvidia Shadowplay. This will disable the GPU from using Shadowplay. This will increase performance.
5. Enable/Disable Resizable bar. This will enable the GPU from using Resizable bar. This will increase performance. **Only Available for the 30 series**

 **For those who are using an Intel/AMD CPU, you can disable the following:**
 
 
Disable Intel Hyperthreading using Process Lasso. This will disable the CPU from using hyperthreading. This will increase performance.




 **Miscellaneous BIOS Tweaks:**



1. Enable XMP or DOCP or EXPO. This will enable the RAM to run at a higher speed. This will increase performance.
2. Enable UEFI. This will enable your system to run at 64-bit speed and support TPM. This could increase performance.

 **Memory Tweaks:**

Memory optimizations for ASUS motherboards **[https://www.asus.com/us/support/FAQ/1042256](https://www.asus.com/us/support/FAQ/1042256)**.

Memory optimizations for MSI motherboards **[https://www.msi.com/blog/memory-force](https://www.msi.com/blog/memory-force)**.

### **Driver Tweaks**

---

If you have intel hardware you can install the intel driver and support assistant. This will allow you to update your drivers. **[https://www.intel.com/content/www/us/en/support/detect.html](https://www.intel.com/content/www/us/en/support/detect.html)**. Only works with Intel hardware. **Recommended**

If you have AMD hardware you can install the AMD driver and support assistant. This will allow you to update your drivers. **[https://www.amd.com/en/support](https://www.amd.com/en/support)**. Only works with AMD hardware. **Recommended**

If you have Nvidia hardware you can install the Nvidia drivers and geforce experience. This will allow you to update your drivers. **[https://www.nvidia.com/en-us/drivers](https://www.nvidia.com/en-us/drivers)**. Only works with Nvidia hardware. **Recommended**

**Debloat NVIDIA Drivers:**

1. Download **[DDU](https://www.guru3d.com/files-details/display-driver-uninstaller-download.html)**.

2. Download **[NVCleanstall](https://www.techpowerup.com/nvcleanstall/)**.

3. Boot into safe mode.

4. Run DDU and uninstall the drivers.

5. **Reboot.**

6. Run NVCleanStall and build the driver using these settings;

<p>
	<img src="/assets/nvcleanstall_guide.jpg" alt="NVCleanstall" /></a>
</p>

7. Install the drivers from the package that NVcleanstall created.

8. **Reboot.**

### **Programming Tools**
 
---

Chocolatey is a package manager for windows. It allows you to install programs from the command line. **[https://chocolatey.org/install](https://chocolatey.org/install)**. **Recommended**

Scoop is a package manager for windows. It allows you to install programs from the command line. **[https://scoop.sh/](https://scoop.sh/)**. **Recommended**


### **Gaming Configs**

---

An NVIDIA Config. **[https://drive.google.com/drive/folders/16mqXNV5ToHmhZIO5R8RfnD9YhVZ5Ueix?usp=share_link](https://drive.google.com/drive/folders/16mqXNV5ToHmhZIO5R8RfnD9YhVZ5Ueix?usp=share_link)**. 

A config for Modern Warfare 2 & Warzone 2. **[https://drive.google.com/drive/folders/1n-g10GF6DOOOBxRMTeDA31wT2pQIMozF?usp=share_link](https://drive.google.com/drive/folders/1n-g10GF6DOOOBxRMTeDA31wT2pQIMozF?usp=share_link)**. 

A config for Apex Legends. **[https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz](https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz)**.

A config for Destiny 2 **[https://drive.google.com/drive/folders/1luSpEJRd5lpyaVkgxMroVl4p4-jOO2zZ?usp=share_link](https://drive.google.com/drive/folders/1luSpEJRd5lpyaVkgxMroVl4p4-jOO2zZ?usp=share_link)**.

A config for The Last Of Us Part 1 **[https://drive.google.com/drive/folders/1_MCWZXv9EOfIi6f_f4qJ_qFi52Sj9wcN?usp=share_link](https://drive.google.com/drive/folders/1_MCWZXv9EOfIi6f_f4qJ_qFi52Sj9wcN?usp=share_link)**.

A config for Battlefield 2042 [https://drive.google.com/drive/folders/1sBJ3xZnZRAbON-auM0TaWSIIVrFgdwuy?usp=share_link](https://drive.google.com/drive/folders/1sBJ3xZnZRAbON-auM0TaWSIIVrFgdwuy?usp=share_link)

A config for Elden Ring **[https://drive.google.com/drive/folders/1uNCmr3_UttUiv9mSlMig47kJy5k_55KK?usp=share_link](https://drive.google.com/drive/folders/1uNCmr3_UttUiv9mSlMig47kJy5k_55KK?usp=share_link)**.

A config for Apex Legends (DX11 & DX12) **[https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz](https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz)**.

A config for Halo Infinite **[https://drive.google.com/drive/folders/1KxkTIaptRysTj3cSkKDf5OAh1v58fxe3?usp=share_link](https://drive.google.com/drive/folders/1KxkTIaptRysTj3cSkKDf5OAh1v58fxe3?usp=share_link)**.

A config for Shatterline **[https://drive.google.com/drive/folders/1dK9_n8d23-LqYlOUMG5sXbDNNdvcdAWB?usp=share_link](https://drive.google.com/drive/folders/1dK9_n8d23-LqYlOUMG5sXbDNNdvcdAWB?usp=share_link)**.

A config for Valorant **[https://drive.google.com/drive/folders/11EkV5vZnaA4JArvVrD6PnyVcYA5OkUhX?usp=share_link](https://drive.google.com/drive/folders/11EkV5vZnaA4JArvVrD6PnyVcYA5OkUhX?usp=share_link)**.

A config for Fortnite **[https://drive.google.com/drive/folders/1zYUWd3FQ5fBkaEse-3uCh1JpY_afq-uD?usp=share_link](https://drive.google.com/drive/folders/1zYUWd3FQ5fBkaEse-3uCh1JpY_afq-uD?usp=share_link)**.

A config for CS: GO **[https://drive.google.com/drive/folders/1Z1M2krDzhzyGwkJoC1kDJVvj_BtJkRS-?usp=sharing](https://drive.google.com/drive/folders/1Z1M2krDzhzyGwkJoC1kDJVvj_BtJkRS-?usp=sharing)**.

**Safe to use HoneCTRL settings for NVIDIA:**


All credit goes too **[https://www.tiktok.com/@thesoaptech](https://www.tiktok.com/@thesoaptech)**.
### **Credits and Useful Links**

---

My Tech Blog can be found here **[https://dev.lukehjo.tech/](https://dev.lukehjo.tech/)**.

My forum can be found here **[https://forum.lukehjo.tech/](https://forum.lukehjo.tech/)**.

The Author of this guide can be found here **[https://github.com/luke-beep](https://github.com/luke-beep)**.

Guide to TCP Optimizer can be found here **[https://www.speedguide.net/faq/35-what-are-the-best-tcp-optimizer-settings-for-474](https://www.speedguide.net/faq/35-what-are-the-best-tcp-optimizer-settings-for-474)**.

An unofficial guide to Process Lasso can be found here **[https://www.youtube.com/watch?v=m7Ki5DYME9M](https://www.youtube.com/watch?v=m7Ki5DYME9M)**.

A Display Driver Uninstaller also known as DDU Guide can be found here **[https://www.wagnardsoft.com/content/DDU-Guide-Tutorial](https://www.wagnardsoft.com/content/DDU-Guide-Tutorial)**.

An unofficial guide for NVCleanstall can be found at **[https://www.makeuseof.com/customize-nvidia-driver-installation-with-cleanstall/](https://www.makeuseof.com/customize-nvidia-driver-installation-with-cleanstall/)**.

An unofficial guide for MSI Afterburner can be found at **[https://www.youtube.com/watch?v=qiKXUG64neA](https://www.youtube.com/watch?v=qiKXUG64neA)**.

The author to some of the game configs can be found here **[https://www.tiktok.com/@thesoaptech](https://www.tiktok.com/@thesoaptech)**.

Calypto's Latency Guide **[https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit](https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit)**.

----

**<div align="center"> Contact me at lukehjo@gmail.com | © 2023 LukeHjo. All rights reserved. <div>**
<br>
<a href="https://twitter.com/luckylukehjo" target="_blank" rel="noopener">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="width: 30px; height: 30px;"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"/></svg>
</a>
<a href="https://github.com/luke-beep" target="_blank" rel="noopener">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" style="width: 30px; height 30px;"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"/></svg>
</a>