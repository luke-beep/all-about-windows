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

<img src="../assets/AMD/amd_amd.png">

### **Miscellaneous BIOS Tweaks**

- Enable XMP or DOCP or EXPO. This will enable the RAM to run at a higher speed. This will increase performance.
- Enable UEFI. This will enable your system to run at 64-bit speed and support TPM. This could increase performance.

### **Memory Tweaks**

- Memory optimizations for ASUS motherboards **[https://www.asus.com/us/support/FAQ/1042256](https://www.asus.com/us/support/FAQ/1042256)**.

- Memory optimizations for MSI motherboards **[https://www.msi.com/blog/memory-force](https://www.msi.com/blog/memory-force)**.
 