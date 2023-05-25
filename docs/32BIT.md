- Open an elevated command prompt and type `bcdedit /set increaseuserva 3072` and press enter. This will increase the amount of virtual memory that your computer can use. This can help with crashes if you have a 32 bit system. **Do not do this on a 64 bit system.**

> On 32-bit editions of Windows, applications have 4 gigabyte (GB) of virtual address space available. The virtual address space is divided so that 2 GB is available to the application and the other 2 GB is available only to the system. The 4-gigabyte tuning feature, enabled with the increaseuserva option, allows you to increase the virtual address space that is available to the application up to 3 GB, which reduces the amount available to the system to between 1 and 2 GB. The BCEdit /set increaseuserva Megabytes command can specify any value between 2048 (2 GB) and 3072 (3 GB) megabytes in decimal notation. Windows uses the remaining address space (4 GB minus the specified amount) as its kernel-mode address space.

It essentially affects the virtual address space allocation between applications and the system. Which in simpler terms means that you're adjusting how much memory gets allocated to applications and how much memory gets allocated to the system. I've not tested this feauture as I don't have access to a 32-bit system. If you do test this feature, please let me know how it goes by opening an [issue](https://github.com/luke-beep/guide-to-optimizing-windows/issues).

---


**<div align="center" id="footer"> Contact me at lukehjo@gmail.com | © 2023 LukeHjo. All rights reserved. <div>**
<br>

<div align="right"><a href="#">(Back to top)</a></div>