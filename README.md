# **An in-depth guide on optimizations for Windows [It's currently being rewritten, so I'd advise against using it for now]**

<div align="center">
	<br />
	<p>
		<a href="#"><img src="./assets/Windows/win.png" width="540" alt="Windows Logo" /></a>
	</p>
	<br />
	<p>
		<a href="https://discord.gg/ndjNzKCmff"><img src="https://img.shields.io/badge/discord-join-blue?style=flat-square&logo=discord" alt="My Discord server" /></a>
		<a href="https://github.com/luke-beep"><img src="https://img.shields.io/badge/github-view-blue?style=flat-square&logo=github" alt="My Github profile" /></a>
        <a href="https://www.youtube.com/channel/UC_-YAH9OBLVVWom_wV4HHxw"><img src="https://img.shields.io/badge/youtube-view-blue?style=flat-square&logo=youtube" alt="My Youtub Channel"></a>
		<a href="https://github.com/sponsors/luke-beep"><img src="https://img.shields.io/github/sponsors/luke-beep?style=flat-square" alt="Github Sponsor"/></a>
</div>





<div align="center">

[**Guide version & date last updated**](/docs/VERSION.md) 

 [**Latest Windows 10 Winver**](https://learn.microsoft.com/en-us/windows/release-health/release-information) | [**Latest Windows 11 Winver**](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information) | [**My Winver**](/docs/WINVER.md)

 [**License**](/LICENSE) | [**Contributing**](.github/CONTRIBUTING.md) | [**Security**](.github/SECURITY.md) | [**Database**](/docs/DATABASE.md) | [**Issues**](https://github.com/luke-beep/guide-to-optimizing-windows/issues) | [**Security**](.github/SECURITY.md) | [**Roadmap**](https://github.com/users/luke-beep/projects/2) | [**Pull Requests**](.github/PULL_REQUEST_TEMPLATE.md)

</div>

**Note:** This guide/collection is not **finished**, it's in very early beta and I'd appreciate some feedback. This guide is made for windows 10 64-bit and 11 64-bit. If you are using windows 7 or 8, you can use this guide but some of the steps may not work. It is advised to make a backup of your computer before doing any of the steps in this guide. Here is a guide on how to **[create a system restore point](https://support.microsoft.com/en-us/windows/create-a-system-restore-point-77e02e2a-3298-c869-9974-ef5658ea3be9)**. If you feel like anything is missing or needs to be changed, feel free to make a [pull request or open an issue](/SECURITY.md#reporting-a-vulnerability).

**Disclaimer:** I am not responsible for any damage done to your computer. This guide is for educational purposes only.

> Make sure that you have the latest version of before Windows following this guide. As of current date it would be [**Windows 10**](https://learn.microsoft.com/en-us/windows/release-health/release-information) | [**Windows 11**](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information)




### **Table of Contents**

- [**Service Tweaks**](/docs/SERVICE-TWEAKS.md)
- [**Gaming Tweaks**](/docs/GAMING-TWEAKS.md)
- [**Network Tweaks**](/docs/NETWORK.md)
	- [**Cloudflare IPv4 DNS Servers**](/docs/NETWORK.md#cloudflare-ipv4-dns-servers)
	- [**Cloudflare IPv6 DNS Servers**](/docs/NETWORK.md#cloudflare-ipv6-dns-servers)
	- [**Google IPv4 DNS Servers**](/docs/NETWORK.md#google-ipv4-dns-servers)
	- [**Google IPv6 DNS Servers**](/docs/NETWORK.md#google-ipv6-dns-servers)
	- [**Quad9 IPv4 DNS Servers**](/docs/NETWORK.md#quad9-ipv4-dns-servers)
	- [**Quad9 IPv6 DNS Servers**](/docs/NETWORK.md#quad9-ipv6-dns-servers)
	- [**Good to know IPConfig commands**](/docs/NETWORK.md#good-to-know-ipconfig-commands)
	- [**Generally good to know know commands**](/docs/NETWORK.md#generally-good-to-know-commands)
	- [**Bandwidth Measurement**](/docs/NETWORK.md#bandwidth-measurement)
- [**Optional Tweaks**](/docs/OPTIONAL-TWEAKS.md)
- [**NVIDIA Tweaks**](/docs/NVIDIA-TWEAKS.md)
- [**AMD & Intel CPU Tweaks**](/docs/AMD-INTEL.md)
- [**Visual Tweaks**](/docs/VISUAL.md)
- [**BIOS Tweaks**](/docs/BIOS.md)
    - [**Intel CPU**](/docs/BIOS.md#for-those-who-are-using-an-intel-cpu-you-can-disable-the-following)
	- [**AMD CPU**](/docs/BIOS.md#for-those-who-are-using-a-amd-cpu-you-can-disable-the-following)
	- [**NVIDIA GPU**](/docs/BIOS.md#for-those-who-are-using-an-nvidia-gpu-you-can-do-the-following)
	- [**Intel GPU**](/docs/BIOS.md#for-those-who-are-using-an-intel-gpu-you-can-do-the-following)
	- [**AMD GPU & AMD CPU**](/docs/BIOS.md#for-those-who-are-using-an-amd-gpu--an-amd-cpu-you-can-do-the-following)
	- [**Miscellaneous BIOS Tweaks**](/docs/BIOS.md#miscellaneous-bios-tweaks)
	- [**Memory Tweaks**](/docs/BIOS.md#memory-tweaks)
- [**Driver Tweaks**](/docs/DRIVER-TWEAKS.md)
	- [**Debloat NVIDIA Drivers**](/docs/DRIVER-TWEAKS.md#debloat-nvidia-drivers)
- [**Programming Tools**](/docs/PROGRAMMING-TOOLS.md)
- [**Gaming Configs**](/docs/CONFIGURATIONS.md)
	- [**My Powerplan**](/docs/CONFIGURATIONS.md#my-powerplan)
- [**Safe to use HoneCTRL settings for NVIDIA**](/docs/HONE.md)
- [**32-bit Tweaks**](/docs/32BIT.md)
- [**FAQ**](/docs/FAQ.md)
- [**Dive deeper into optimization**](/docs/DATABASE.md)
- [**Credits**](/docs/DATABASE.md)

> This guide is based on my own personal research and experience, although I do use external sources & guides as an inspiration. It isn't my intent to replicate their content. All of the references and sources are linked in the [database](/docs/DATABASE.md). 

---


**<div align="center" id="footer"> Contact me at lukehjo@gmail.com | © 2023 LukeHjo. All rights reserved. <div>**
<br>

<div align="right"><a href="#">(Back to top)</a></div>
