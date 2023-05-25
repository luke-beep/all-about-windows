### **Service Tweaks**

---

**Disclaimers for this section specifically:** Do not, and I repeat do NOT disable any service that you don't know what it does. If you do not know what a service does, then google it. If you disable a service that is required for your computer to run, unexpected errors might popup. I am not responsible for any damage done to your computer. This guide is for educational purposes only.

1. To begin with this section, you have to open up services.msc. To do this you can either WIN + R and type "services.msc" or you can open up task manager and go to the services tab and click on "Open Services" at the bottom of the window. Or by simply searching for services in the start menu.

2. Identify the unnecessary services: Look through the list of services and identify those that you don't need. You can use [this](/docs/SERVICES.md) list to identify services that's unnecessary and that can be safely disabled.

3. Disable unnecessary services, to disable a service, right-click on it and select "Properties". In the "Startup type" drop-down menu, select "Disabled". Click "Apply" and then "OK" to save your changes. Repeat this step for any other unnecessary services.

4. Restart your computer: Once you've made changes to the services, it's a good idea to restart your computer to ensure that the changes take effect instantly.

> Optimizing Windows services can help improve your computer's performance by reducing unnecessary resource usage and delta cycles. However, it's important to be extra careful when disabling services, as some services are required for important things. If you disable a service that's required for your computer to run, unexpected errors might popup. So, make sure to only disable services that you don't need.