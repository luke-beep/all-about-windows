# **HoneCTRL** can be downloaded from the [official repository](https://github.com/auraside/HoneCtrl).

> **HoneCTRL** is a software designed for tweaking and optimizing your computer's performance. It allows you to adjust various system settings, such as CPU and RAM usage, power management, and network configurations, to get the most out of your computer's hardware. However, it is important to be cautious when using **HoneCTRL** and similar tweaking software, as making the wrong changes can cause serious problems and even damage your system. It's always a good idea to set a restore point before making any adjustments, so you can easily revert to a stable version if something goes wrong.

- **Optimizations Page 1**
> <img src="../assets/hone_general_1.png" alt="Optimizer" title="Optimizer">

- **Optimizations Page 2**
> <img src="../assets/hone_general_2.png" alt="Optimizer" title="Optimizer">

- **Advanced Tab**
> <img src="../assets/hone_advanced.png" alt="Optimizer" title="Optimizer">


## **Settings Explained**

--- 

### **Optimizations Page 1**

- Power Plan
    - Don't enable this if you have a laptop. [Hone power plan](/configurations/Hone/HoneV2.pow) will enable Processor idle disable power setting. This will disable the CPU from going into idle state. This will increase performance but will also increase power consumption and heat. All of the power plan settings can be found [here](https://bitsum.com/known-windows-power-guids/). If you want to view your own power plan settings you can do so by running `powercfg /Q` in command prompt.
- SvcHostSplitThreshold
    - This setting will split the SvcHost process into multiple processes. This will increase transparency by allowing you to view every single service individually. It'll allow you to fix any issues with a specific service. 
- CSRSS High Priority
    - As mentioned in the name, this will set the CSRSS process to high priority. This will could potentially increase performance but could increase latency as well. It's best to benchmark this setting to see if it's worth it.
- Timer Resolution 
    - This will set the timer resolution to 0.5ms using the [SetTimerResolutionService](/Applications/SetTimerResolutionService.exe) service. It is the same as running the normal Timer Resolution application but this one will run as a service. 


---

**<div align="center" id="footer"> Contact me at lukehjo@gmail.com | © 2023 LukeHjo. All rights reserved. <div>**
<br>

<div align="right"><a href="#">(Back to top)</a></div>
