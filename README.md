# A guide for optimizing windows 10 and 11


**Date last updated:** 12 November 2022

**Winver:** 22H2 (to check winver version do WIN + R and type "winver" and press enter.)

**Note:** This guide is for windows 10 64-bit and 11 64-bit. If you are using windows 7 or 8, you can use this guide but some of the steps may not work. It is advised to make a backup of your computer before doing any of the steps in this guide How to [Create a system restore point](https://support.microsoft.com/en-us/windows/create-a-system-restore-point-77e02e2a-3298-c869-9974-ef5658ea3b9).

**Disclaimer:** I am not responsible for any damage done to your computer. This guide is for educational purposes only.
### **General Tweaks**

---

1. Uninstall all unnecessary apps.

2. Make sure that you have the latest version of windows. As of current date it would be 22H2. 

3. Download this program [https://github.com/hellzerg/optimizer/releases](https://github.com/hellzerg/optimizer/releases) and follow the next few steps.

<img src="optimizer.png" alt="Optimizer" title="Optimizer">

For example, if you would like to keep print service on then you do not tick "Disable Print Service".

4. Disable all the unnecessary startup apps. To do this you want to go and open up Task Manager. Go to the Startup tab and disable all the apps that you do not use.

5. To complete this process you may need to go into regedit and the delete some startup keys from there, or you could use [https://github.com/hellzerg/optimizer/releases](https://github.com/hellzerg/optimizer/releases) and simply go to the Startup tab and select all the apps that you do not use and delete them.


**<img src="tab1.png" alt="Optimizer" title="Optimizer">
<img src="tab2.png" alt="Optimizer" title="Optimizer">
<img src="tab3.png" alt="Optimizer" title="Optimizer">
<img src="tab4.png" alt="Optimizer" title="Optimizer">**

When you recieve the popup to delete all the selected startup items click yes.

6. Run Windows Disk Cleanup. WIN + R and type "cleanmgr.exe", then press enter. Choose your drive and press **OK**. Then select what you would like to clean up and hit **OK**.

8. Run Windows Defragment and trimmer. WIN + R and type "dfrgui.exe", then press enter. Select your drive and press Optimize or Analyze.

9. Change energy plan. Open control panel and search for power plan. Then select **show additional plans** and select **Ultimate Performance**.

### **Service Tweaks**

---

1. Disable Windows Defender. WIN + R and type "services.msc", then press enter. Scroll down to Windows Defender and double click it. Change the startup type to **disabled** and press **stop**.

2. Disable Windows Update. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update and double click it. Change the startup type to **disabled** and press **stop**.

3. Disable Windows Update Delivery Optimization. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Delivery Optimization and double click it. Change the startup type to **disabled** and press **stop**.

4. Disable Windows Update Service Host. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Service Host and double click it. Change the startup type to **disabled** and press **stop**.

5. Disable Windows Update User Interface. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update User Interface and double click it. Change the startup type to **disabled** and press **stop**.

6. Disable Windows Update Medic Service. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Medic Service and double click it. Change the startup type to **disabled** and press **stop**.

7. Disable Windows Update Network Diagnostics. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Network Diagnostics and double click it. Change the startup type to **disabled** and press **stop**.

8. Disable Windows Update Orchestrator. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Orchestrator and double click it. Change the startup type to **disabled** and press **stop**.

9. Disable Windows Update Readiness. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Readiness and double click it. Change the startup type to **disabled** and press **stop**.

10. Disable Windows Update Service Registration. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Service Registration and double click it. Change the startup type to **disabled** and press **stop**.

11. Disable Windows Update Service Manager. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Service Manager and double click it. Change the startup type to **disabled** and press **stop**.

12. Disable Windows Update Service Session Manager. WIN + R and type "services.msc", then press enter. Scroll down to Windows Update Service Session Manager and double click it. Change the startup type to **disabled** and press **stop**.



### **Gaming Tweaks**

---

[Process Lasso](https://bitsum.com/) is an advanced process priority optimization and system automation utility.




### **Opitional Tweaks**

---

WPD is a privacy tool [https://wpd.app/](https://wpd.app/). It is a free and open source tool that allows you to disable telemetry and other privacy invasive features in Windows 10 and 11. It is recommended to use this tool if you are concerned about your privacy.

[https://www.bleachbit.org/](https://www.bleachbit.org/) is a disk cleaner for windows.

[https://www.oo-software.com/en/shutup10/update](https://www.oo-software.com/en/shutup10/update) an antispy tool for windows 10 and 11.

[https://www.speedguide.net/downloads.php](https://www.speedguide.net/downloads.php). This is a tool that will help you optimize your internet connection. It's called TCP Optimizer. You would want to download version 4.0.14. It's the latest version.

[https://github.com/auraside/HoneCtrl](https://github.com/auraside/HoneCtrl) a windows bat script. Aimed to optimize your computer for general use and gaming.


### **Guides**

---

Guide to TCP Optimizer can be found here [https://www.speedguide.net/faq/35-what-are-the-best-tcp-optimizer-settings-for-474](https://www.speedguide.net/faq/35-what-are-the-best-tcp-optimizer-settings-for-474).

An unofficial guide to Process Lasso can be found here [https://www.youtube.com/watch?v=m7Ki5DYME9M](https://www.youtube.com/watch?v=m7Ki5DYME9M).

### **General Information**

---



### Credits

---

This guide was made by me, LukeHjo#0001.



