https://blog.supermechanical.com/2024/06/27/debugging-hardware-is-hard/
The root cause was identified as an issue with the MSI auto-calibration against the 32KHz crystal, which caused UART glitches. After addressing this, the system achieved a 99.99995% success rate on first attempts and 100% on retries.

