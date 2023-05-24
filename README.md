# **An in-depth guide on optimizations for Windows**

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
		<a href="https://github.com/sponsors/luke-beep"><img src="https://img.shields.io/github/sponsors/luke-beep?style=flat-square" alt="Github Sponsor"/></a>

</div>





<div align="center">

[**Guide Version & Date last updated**](/render/version.md)

[**License**](/LICENSE)

[**Winver**](/render/winver.md)


 [**Latest Windows 10 Winver**](https://learn.microsoft.com/en-us/windows/release-health/release-information) | [**Latest Windows 11 Winver**](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information)

</div>

**Note:** This guide/collection is for windows 10 64-bit and 11 64-bit. If you are using windows 7 or 8, you can use this guide but some of the steps may not work. It is advised to make a backup of your computer before doing any of the steps in this guide. Here is a guide on how to **[create a system restore point](https://support.microsoft.com/en-us/windows/create-a-system-restore-point-77e02e2a-3298-c869-9974-ef5658ea3be9)**. If you feel like anything is missing or needs to be changed, feel free to make a [pull request or open an issue](/SECURITY.md#reporting-a-vulnerability).

**Disclaimer:** I am not responsible for any damage done to your computer. This guide is for educational purposes only.



### **Table of Contents**

- [**General Tweaks**](#general-tweaks)
- [**Service Tweaks**](#service-tweaks)
- [**Gaming Tweaks**](#gaming-tweaks)
- [**Network Tweaks**](#network-tweaks)
	- [**Cloudflare IPv4 DNS Servers**](#cloudflare-ipv4-dns-servers)
	- [**Cloudflare IPv6 DNS Servers**](#cloudflare-ipv6-dns-servers)
	- [**Google IPv4 DNS Servers**](#google-ipv4-dns-servers)
	- [**Google IPv6 DNS Servers**](#google-ipv6-dns-servers)
	- [**Quad9 IPv4 DNS Servers**](#quad9-ipv4-dns-servers)
	- [**Quad9 IPv6 DNS Servers**](#quad9-ipv6-dns-servers)
	- [**Good to know IPConfig commands**](#good-to-know-ipconfig-commands)
	- [**Generally good to know know commands**](#generally-good-to-know-commands)
	- [**Bandwidth Measurement**](#bandwidth-measurement)
- [**Optional Tweaks**](#optional-tweaks)
- [**NVIDIA Tweaks**](#nvidia-tweaks)
- [**AMD & Intel CPU Tweaks**](#amd--intel-cpu-tweaks)
- [**Visual Tweaks**](#visual-tweaks)
- [**BIOS Tweaks**](#bios-tweaks)
    - [**Intel CPU**](#for-those-who-are-using-an-intel-cpu-you-can-disable-the-following)
	- [**AMD CPU**](#for-those-who-are-using-a-amd-cpu-you-can-disable-the-following)
	- [**NVIDIA GPU**](#for-those-who-are-using-an-nvidia-gpu-you-can-do-the-following)
	- [**Intel GPU**](#for-those-who-are-using-an-intel-gpu-you-can-do-the-following)
	- [**AMD GPU & AMD CPU**](#for-those-who-are-using-an-amd-gpu--an-amd-cpu-you-can-do-the-following)
	- [**Miscellaneous BIOS Tweaks**](#miscellaneous-bios-tweaks)
	- [**Memory Tweaks**](#memory-tweaks)
- [**Driver Tweaks**](#driver-tweaks)
	- [**Debloat NVIDIA Drivers**](#debloat-nvidia-drivers)
- [**Programming Tools**](#programming-tools)
- [**Gaming Configs**](#gaming-configs)
	- [**My Process Lasso Configuration**](#my-process-lasso-configuration)
	- [**My Powerplan**](#my-powerplan)
- [**Safe to use HoneCTRL settings for NVIDIA**](#safe-to-use-honectrl-settings-for-nvidia)
- [**Useful Links/Downloads**](#useful-linksdownloads)
- [**Dive deeper into optimization**](#dive-deeper-into-optimization)
- [**Credits**](#credits)

### **General Tweaks**

---

- Uninstall all unnecessary apps by using `appwiz.cpl` in Run (WIN + R).

- Make sure that you have the latest version of windows. As of current date it would be [**Windows 10**](https://learn.microsoft.com/en-us/windows/release-health/release-information) | [**Windows 11**](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information). 

- Open an elevated command prompt and type `bcdedit /set increaseuserva 3072` and press enter. This will increase the amount of virtual memory that your computer can use. This will help with performance and crashes if you have a 32 bit system. **Do not do this on a 64 bit system.**

> Open an elevated command prompt and type `slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX`. Then set a KMS server by typing `slmgr /skms kms8.msguides.com`. Then activate windows by typing `slmgr /ato`. This will activate windows and make it enable all the features and remove the ugly watermark. Run `slmgr /xpr` to check if it worked.



### **Service Tweaks**

---

**Disclaimers for this section specifically:** Do not, and I repeat do NOT disable any service that you don't know what it does. If you do not know what a service does, then google it. If you disable a service that is required for your computer to run, unexpected errors might popup. I am not responsible for any damage done to your computer. This guide is for educational purposes only.

1. To begin with this section, you have to open up services.msc. To do this you can either WIN + R and type "services.msc" or you can open up task manager and go to the services tab and click on "Open Services" at the bottom of the window. Or by simply searching for services in the start menu.

2. Identify the unnecessary services: Look through the list of services and identify those that you don't need. You can use google to identify services that's unnecessary and that can be safely disabled.

3. Disable unnecessary services, to disable a service, right-click on it and select "Properties". In the "Startup type" drop-down menu, select "Disabled". Click "Apply" and then "OK" to save your changes. Repeat this step for any other unnecessary services.

4. Restart your computer: Once you've made changes to the services, it's a good idea to restart your computer to ensure that the changes take effect instantly.

> Optimizing Windows services can help improve your computer's performance by reducing unnecessary resource usage and delta cycles. However, it's important to be extra careful when disabling services, as some services are required for important things. If you disable a service that's required for your computer to run, unexpected errors might popup. So, make sure to only disable services that you don't need.

### **Gaming Tweaks**

---

- Disable hardware acceleration on everything, your browser, discord etc. This will increase performance by a lot. 

- Disable all ingame overlays. This will increase performance by a lot.


- **[Process Lasso](https://bitsum.com/)** is an advanced process priority optimization and system automation utility.

- **[https://www.msi.com/Landing/afterburner/graphics-cards](https://www.msi.com/Landing/afterburner/graphics-cards)** is a graphics card overclocking utility.

- **[https://www.guru3d.com/files-details/display-driver-uninstaller-download.html](https://www.guru3d.com/files-details/-display-driver-uninstaller-download.html)** is a display driver uninstaller which you can bundle up with NVCleanstall to debloat your graphics card drivers **[https://www.techpowerup.com/nvcleanstall/](https://www.techpowerup.com/nvcleanstall/)**.

- **[https://www.techpowerup.com/download/techpowerup-gpu-z/](https://www.techpowerup.com/download/techpowerup-gpu-z/)** is a graphics - card information utility.

- **[https://www.techpowerup.com/download/cpu-z/](https://www.techpowerup.com/download/cpu-z/) or [https://www.cpuid.com/softwares/cpu-z.html](https://www.cpuid.com/softwares/cpu-z.html)**  is a freeware that gathers information on some of the main devices of your system.

### **Network Tweaks**

---

#### **Cloudflare IPv4 DNS Servers**

1.1.1.1 and 1.0.0.1

#### **Cloudflare IPv6 DNS Servers**

2606:4700::1111 and 2606:4700:4700::1001

#### **Google IPv4 DNS Servers**

 8.8.8.8 and 8.8.4.4
 
#### **Google IPv6 DNS Servers**

2001:4860:4860::8888 and 2001:4860:4860::8844

#### **Quad9 IPv4 DNS Servers**

9.9.9.9 and 149.112.112.112

#### **Quad9 IPv6 DNS Servers**

2620:fe::fe and 2620:fe::9

#### **Good to know IPConfig commands**

`ipconfig /flushdns` - Flushes the DNS cache.

`ipconfig /Displaydns` - Shows information about your current DNS server.

`ipconfig /Registerdns` - Initiates manual dynamic registration for the DNS names and IP addresses that are configured at a computer.

`ipconfig /release` - Releases the IPv4 address that you are currently using.

`ipconfig /release6` - Releases the IPv6 address that you are currently using.

`ipconfig /renew` - Renews an IPv4 address on your device.

`ipconfig /renew6` - Renews an IPv6 address on your device.

`ipconfig /all` - Displays all the information about all your current network adapters.

`ipconfig /?` - Help for IPConfig.

#### **Generally good to know commands**

`netsh => /?` -  A powerful command for configuring network adapters.

`netstat` - Displaying Network Statistics.

`net` - View different parts of your network.

`nslookup` - Useful for diagnosing DNS name resolution problems.

`hostname` -  Identify your current hostname.

`arp` - Modify & Display the Address Resolution Protocol cache.

`getmac` - Displays your current MAC address.

`systeminfo` - Information about your device.

`pathping` - Combines Ping & Tracert.

`tracert` - Trace packets to a destination.


#### **Bandwidth Measurement**

**Mb** - Megabit

**MB** - Megabyte

**Mbps** - Megabit per second.

**MBps** - Megabyte per second.

**b** - bit

**B** - byte


**https://1.1.1.1/**

**https://developers.google.com/speed/public-dns/docs/using**

**https://www.quad9.net/service/service-addresses-and-features**

**https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ipconfig**


### **Optional Tweaks**

---

- WPD is a privacy tool **[https://wpd.app/](https://wpd.app/)**. It is a free and open source tool that allows you to disable telemetry and other privacy invasive features in Windows 10 and 11. It is recommended to use this tool if you are concerned about your privacy.

- **[https://www.diskanalyzer.com/](https://www.diskanalyzer.com/)** is a disk cleaner for windows. **Recommended**

- **[https://www.oo-software.com/en/shutup10/update](https://www.oo-software.com/en/shutup10/update)** an antispy tool for windows 10 and 11.

- **[https://www.speedguide.net/downloads.php](https://www.speedguide.net/downloads.php)**. This is a tool that will help you optimize your internet connection. It's called TCP Optimizer. You would want to download version 4.0.14. It's the latest version.

- **[https://github.com/auraside/HoneCtrl](https://github.com/auraside/HoneCtrl)** a windows bat script. Aimed to optimize your computer for general use and gaming. 

- A windows tool that allows you to achive maximum productivity **[https://github.com/microsoft/PowerToys](https://github.com/microsoft/PowerToys)**. **Recommended**

- **[https://www.malwarebytes.com/solutions/rootkit-scanner](https://www.malwarebytes.com/solutions/rootkit-scanner)** a rootkit scanner. **Recommended**

- **[https://www.malwarebytes.com/solutions/malware-scanner](https://www.malwarebytes.com/solutions/malware-scanner)** a malware scanner. **Recommended**

- **[https://github.com/builtbybel/BloatsyNosy](https://github.com/builtbybel/BloatyNosy)** a windows 11 tweaker, only available for windows 11. **Recommended**

### **NVIDIA Tweaks**

--- 

- Disable NVIDIA Adaptive V-Sync. This will disable the GPU from using Adaptive V-Sync. This will increase performance.

- Disable NVIDIA Ansel. This will disable the GPU from using Ansel. This will increase performance.

- Disable NVIDIA Ambient Occlusion. This will disable the GPU from using Ambient Occlusion. This will increase performance.

- Disable NVIDIA Shadowplay. This will disable the GPU from using Shadowplay. This will increase performance.

### **AMD & Intel CPU Tweaks** 

---
 
- Disable Intel Hyper-Threading/SMT using Process Lasso. This will disable the CPU from using Hyper-Threading/SMT. This will increase performance in some CPU bound applications/games.

### **Visual Addons** 	

---

- **MicaForEveryone** -  A tool that allows for customization of Win32 apps. **[https://github.com/MicaForEveryone/MicaForEveryone](https://github.com/MicaForEveryone/MicaForEveryone)** **Only Available for Windows 11** |  [**My MicaForEveryone config**](/configurations/MicaForEveryone.conf). 

- **StartAllBack** - **[https://www.startallback.com/](https://www.startallback.com/)** a tool that allows you to change the start menu. **Only Available for Windows 11** | [**My StartAllBack config**](/configurations/StartAllBack.conf).

- **StartAllBack** - **[https://startisback.com/](https://startisback.com/)** a tool that allows you to change the start menu. **Only Available for Windows 10**



### **BIOS Tweaks**

---
**Note: Only disable those that you do not need! If you disable something that you need, something might break.**

### **For those who are using an Intel CPU, you can do the following**

- Disable Intel SpeedStep. This will disable the CPU from going into a low power state. This will increase performance.
- Disable Intel VT-d. This will disable the CPU from using an old Virtualization technology and improve security when using a VM in some cases. This will increase performance.

### **For those who are using a AMD CPU, you can do the following**

- Disable AMD Cool'n'Quiet. This will disable the CPU from going into a low power state. This will increase performance.
- Disable AMD C1E. This will disable the CPU from going into a low power state. This will increase performance.

### **For those who are using an NVIDIA GPU, you can do the following**

- Enable/Disable Resizable bar. This will enable the GPU from using Resizable bar. This will increase performance. **Only Available for the 30 series and up**

### **For those who are using an Intel GPU, you can do the following**

- Enable/Disable Resizable bar. This will enable the GPU from using Resizable bar. This will increase performance. 

- Enable Above 4G Decoding. It's needed for the GPU to use Resizable bar. This will increase performance in some specific cases.

### **For those who are using an AMD GPU & an AMD CPU, you can do the following**

- Enable SAM. "In conventional Windows-based PC systems, processors can only access a fraction of graphics memory (VRAM) at once, limiting system performance.
With AMD Smart Access Memory, the data channel gets expanded to harness the full potential of GPU memory, utilizing the bandwidth of PCI Express® to remove the bottlenecks and increase performance." - [**AMD**](https://www.amd.com/en/technologies/smart-access-memory). **Only do it if you meet the following requirements**.

<img src="/assets/amd_amd.png">

### **Miscellaneous BIOS Tweaks**

- Enable XMP or DOCP or EXPO. This will enable the RAM to run at a higher speed. This will increase performance.
- Enable UEFI. This will enable your system to run at 64-bit speed and support TPM. This could increase performance.

### **Memory Tweaks**

- Memory optimizations for ASUS motherboards **[https://www.asus.com/us/support/FAQ/1042256](https://www.asus.com/us/support/FAQ/1042256)**.

- Memory optimizations for MSI motherboards **[https://www.msi.com/blog/memory-force](https://www.msi.com/blog/memory-force)**.

### **Driver Tweaks**

---

- If you have intel hardware you can install the intel driver and support assistant. This will allow you to update your drivers. **[https://www.intel.com/content/www/us/en/support/detect.html](https://www.intel.com/content/www/us/en/support/detect.html)**. Only works with Intel hardware. **Recommended**

- If you have AMD hardware you can install the AMD driver and support assistant. This will allow you to update your drivers. **[https://www.amd.com/en/support](https://www.amd.com/en/support)**. Only works with AMD hardware. **Recommended**

- If you have Nvidia hardware you can install the Nvidia drivers and geforce experience. This will allow you to update your drivers. **[https://www.nvidia.com/en-us/drivers](https://www.nvidia.com/en-us/drivers)**. Only works with Nvidia hardware. **Recommended**

### **Debloat NVIDIA Drivers**

-  Download **[DDU](https://www.guru3d.com/files-details/display-driver-uninstaller-download.html)**.

-  Download **[NVCleanstall](https://www.techpowerup.com/nvcleanstall/)**.

-  Boot into safe mode.

- Run DDU and uninstall the drivers.

- **Reboot.**

- Run NVCleanStall and build the driver using these settings - This step is optional, the latest debloated drivers can be found here: **[LukeHjo_531.79.exe](/drivers/LukeHjo_531.79.exe)**.

<p>
	<img src="/assets/nvcleanstall_guide.jpg" alt="NVCleanstall" /></a>
</p>

- Install the drivers from the package that NVcleanstall created.

- **Reboot.**

### **Programming Tools**
 
---

- Chocolatey is a package manager for windows. It allows you to install programs from the command line. **[https://chocolatey.org/install](https://chocolatey.org/install)**. **Recommended**

- Scoop is a package manager for windows. It allows you to install programs from the command line. **[https://scoop.sh/](https://scoop.sh/)**. **Recommended**


### **Debugging Tools**

### **Gaming Configs**

---

- An NVIDIA Config. **[https://drive.google.com/drive/folders/16mqXNV5ToHmhZIO5R8RfnD9YhVZ5Ueix?usp=share_link](https://drive.google.com/drive/folders/16mqXNV5ToHmhZIO5R8RfnD9YhVZ5Ueix?usp=share_link)**. 

- A config for Modern Warfare 2 & Warzone 2. **[https://drive.google.com/drive/folders/1n-g10GF6DOOOBxRMTeDA31wT2pQIMozF?usp=share_link](https://drive.google.com/drive/folders/1n-g10GF6DOOOBxRMTeDA31wT2pQIMozF?usp=share_link)**. 

- A config for Apex Legends. **[https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz](https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz)**.

- A config for Destiny 2 **[https://drive.google.com/drive/folders/1luSpEJRd5lpyaVkgxMroVl4p4-jOO2zZ?usp=share_link](https://drive.google.com/drive/folders/1luSpEJRd5lpyaVkgxMroVl4p4-jOO2zZ?usp=share_link)**.

- A config for The Last Of Us Part 1 **[https://drive.google.com/drive/folders/1_MCWZXv9EOfIi6f_f4qJ_qFi52Sj9wcN?usp=share_link](https://drive.google.com/drive/folders/1_MCWZXv9EOfIi6f_f4qJ_qFi52Sj9wcN?usp=share_link)**.

- A config for Battlefield 2042 **[https://drive.google.com/drive/folders/1sBJ3xZnZRAbON-auM0TaWSIIVrFgdwuy?usp=share_link](https://drive.google.com/drive/folders/1sBJ3xZnZRAbON-auM0TaWSIIVrFgdwuy?usp=share_link)**.

- A config for Elden Ring **[https://drive.google.com/drive/folders/1uNCmr3_UttUiv9mSlMig47kJy5k_55KK?usp=share_link](https://drive.google.com/drive/folders/1uNCmr3_UttUiv9mSlMig47kJy5k_55KK?usp=share_link)**.

- A config for Apex Legends (DX11 & DX12) **[https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz](https://drive.google.com/drive/u/2/folders/1KvuaFTN4XeMtVdv1FwknZhE9L0Ac1aNz)**.

- A config for Halo Infinite **[https://drive.google.com/drive/folders/1KxkTIaptRysTj3cSkKDf5OAh1v58fxe3?usp=share_link](https://drive.google.com/drive/folders/1KxkTIaptRysTj3cSkKDf5OAh1v58fxe3?usp=share_link)**.

- A config for Shatterline **[https://drive.google.com/drive/folders/1dK9_n8d23-LqYlOUMG5sXbDNNdvcdAWB?usp=share_link](https://drive.google.com/drive/folders/1dK9_n8d23-LqYlOUMG5sXbDNNdvcdAWB?usp=share_link)**.

- A config for Valorant **[https://drive.google.com/drive/folders/11EkV5vZnaA4JArvVrD6PnyVcYA5OkUhX?usp=share_link](https://drive.google.com/drive/folders/11EkV5vZnaA4JArvVrD6PnyVcYA5OkUhX?usp=share_link)**.

- A config for Fortnite **[https://drive.google.com/drive/folders/1zYUWd3FQ5fBkaEse-3uCh1JpY_afq-uD?usp=share_link](https://drive.google.com/drive/folders/1zYUWd3FQ5fBkaEse-3uCh1JpY_afq-uD?usp=share_link)**.

- A config for CS: GO **[https://drive.google.com/drive/folders/1Z1M2krDzhzyGwkJoC1kDJVvj_BtJkRS-?usp=sharing](https://drive.google.com/drive/folders/1Z1M2krDzhzyGwkJoC1kDJVvj_BtJkRS-?usp=sharing)**.

### **My Process Lasso configuration**
- **Process Lasso** is a software that allows you to control the processes running on your computer. It can be used to set priorities for certain programs, limit the number of cores they use, and more. My configuration is adapted to fit any system. My configuration file can be downloaded here: [Process Lasso Configuration](https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/ProcessLasso_LukeHjo2611.INI). To import this profile you'd have to follow these 4 simple steps:
> 1. Open Process Lasso
> 2. Click on the "File" tab
> 3. Click on "Import Configuration"
> 4. Select the configuration file you downloaded

### **My Powerplan**
- **Powerplan** is a built in feature that allows you to control the power settings of your computer. It can be used to set the power plan to high performance, balanced, power saver or a custom one. My configuration is adapted to fit any system and most of it is taken from the already great Bitsum powerplan. My configuration file can be downloaded here: [Powerplan Configuration](https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/Powerplan_LukeHjo2611.pow). To import this profile you'd have to follow these 4 simple steps:
> 1. Open CMD with elevated privileges.
> 2. Type in `powercfg -import "C:\Users\%USERNAME%\Desktop\Powerplan_LukeHjo2611.pow"`
> 3. Press enter
> 4. Open the powerplan settings and select the imported powerplan or type in `powercfg -list` and then `powercfg -setactive <GUID>` where `<GUID>` is the GUID of the powerplan you want to use.

### **Safe to use HoneCTRL settings for NVIDIA**
----

> [Settings](/render/hone.md)

### **Useful Links/Downloads**

---

- Display Driver Uninstaller also known as DDU Guide can be found here **[https://www.wagnardsoft.com/content/DDU-Guide-Tutorial](https://www.wagnardsoft.com/content/DDU-Guide-Tutorial)**.

- "NVIDIA GeForce Graphics Drivers" - Techpowerup **[https://www.techpowerup.com/download/nvidia-geforce-graphics-drivers/#history](https://www.techpowerup.com/download/nvidia-geforce-graphics-drivers/#history)**.

- "AMD Radeon Graphics Drivers" - Techpowerup **[https://www.techpowerup.com/download/amd-radeon-graphics-drivers/](https://www.techpowerup.com/download/amd-radeon-graphics-drivers/)**.

- "Intel ARC Graphics Drivers" - Techpowerup **[https://www.techpowerup.com/download/intel-arc-graphics-drivers/](https://www.techpowerup.com/download/intel-arc-graphics-drivers/)**.

- "Intel iGPU Graphics Drivers" - Techpowerup **[https://www.techpowerup.com/download/intel-integrated-graphics-drivers/](https://www.techpowerup.com/download/intel-integrated-graphics-drivers/)**.

- My Mica For Everyone configuration **[MicaForEveryone.conf](/configurations/MicaForEveryone.conf)**.

- "AutoGpu Affinity" - Amit **[https://github.com/amitxv/AutoGpuAffinity](https://github.com/amitxv/AutoGpuAffinity)**.


### Dive deeper into optimization

---

> For more information & guides, check out the [**database**](/render/database.md).


### Credits

---

- **nikø#7787**

- **xetanyl#7777**

- [**Auraside**](https://github.com/auraside)

- [**Hellzerg**](https://github.com/hellzerg)

- [**TheSoapTech**](https://www.tiktok.com/@thesoaptech)

> More credits can be found in the [**database**](/database.md).

---
