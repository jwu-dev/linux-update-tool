# Universal Linux Updater Script

A Bash script designed to help automate system updates on various Linux distributions by providing a unified interface. This script currently supports Arch Linux, Debian-based systems (like Linux Mint, Ubuntu), and Fedora.

## Features

* **OS Auto-Detection:** Automatically attempts to detect the running Linux distribution.
* **Multi-Distro Support:**
    * Arch Linux (`pacman`)
    * Debian-based systems (e.g., Linux Mint, Ubuntu) (`apt`)
    * Fedora (`dnf`)
* **Update Preview:** Displays a list of pending updates before asking for confirmation (currently simulated).
* **User Confirmation:** Requires explicit user confirmation ('y/n') before proceeding with any update operations, ensuring user control.
* **Logging:** All major actions and (simulated) command outputs are logged to `updater_script.log` in the script's directory, with timestamps for each run.
* **Basic Error Checking:** Includes (simulated) checks for the success or failure of the main update commands.

## ⚠️ Current Status: Development & Simulation Mode ⚠️

**Important:** The actual system update commands within this script (e.g., `sudo pacman -Syu`, `sudo apt upgrade -y`, `sudo dnf upgrade -y`) are currently **commented out** for safety during development and testing. The script simulates these update processes and their outputs.

To make the script perform *real* system updates, you would need to:
1.  Carefully review the script.
2.  Uncomment the actual update commands within the respective functions (e.g., `update_arch_linux()`, `update_debian_based()`, `update_fedora_linux()`).
3.  **Use with extreme caution, as these commands will make real changes to your system.**

## How to Use

### Prerequisites

* A Bash shell (standard on most Linux distributions).
* Git (if you are cloning this repository).
* The script relies on standard commands like `sudo`, `pacman`, `apt`, `dnf`, `date`, `tee`, `echo`, `read`, `source`.

### Setup & Execution

1.  **Get the Script:**
    * Clone this repository:
        ```bash
        git clone [https://github.com/jwu-dev/linux-update-tool.git](https://github.com/jwu-dev/linux-update-tool.git)
        cd linux-update-tool
        ```
    * Or, download/copy the `updater_script.sh` file directly into a directory on your system (e.g., `~/scripts`).

2.  **Make it Executable:**
    Navigate to the directory containing `updater_script.sh` and run:
    ```bash
    chmod +x updater_script.sh
    ```

3.  **Run the Script:**
    Execute the script from its directory:
    ```bash
    ./updater_script.sh
    ```
    The script will attempt to detect your OS and guide you through the (simulated) update process. You will be prompted for your `sudo` password when the script needs to perform actions that require administrative privileges (like checking for updates or simulating them).

## Future Enhancements (Ideas)

* Implement more robust error handling for each step.
* Add an option to persist the detected OS to speed up subsequent runs.
* Allow users to select specific packages to update or ignore.
* Provide more detailed parsing of update lists.

---

*This script was developed as a purely learning project.*
