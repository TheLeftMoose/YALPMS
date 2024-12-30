# **Project Overview - FOR PROMPT ENGINEERING ONLY**  

This project provides a suite of scripts to manage and clean package managers on Linux systems, supporting both servers and workstations, including WSL2.  

The scripts are designed for local execution only and prioritize clarity, safety, and flexibility. Key features include:  
- Modularized design for specific tasks like updating or cleaning system components.  
- Shared functionality through helper scripts to minimize code duplication and ensure consistency.  
- Dry-run capabilities to simulate actions before execution.  

IMPORTANT: This file suites as input prompt for colabroation with LLMs. There will be generated separate readme and other documentation, furthermore the actual code for each script will be in seperate files in the project repo.

---

## **Project and repo name**  

- Project name: Yet another linux package manager scripts
- Repo name:  TheLeftMoose/YALPMS (github public repo)

---

## **Supported Operating Systems**  

These scripts are designed to work on the following Linux distributions:  
- **Pop!_OS**  
- **Ubuntu Workstation**  
- **Ubuntu Server**  
- **WSL2 (Ubuntu)**  

---

## **Scripts Overview**  

1. **Installation Script**:  
   - Installs the update and cleaner scripts on the system and adds them to the path.  

2. **Update Script**:  
   - Updates system dependencies using supported package managers.  

3. **Cache Cleaner**:  
   - Clears cache for supported package managers (APT, Snap, Flatpak).  

4. **Unused Packages Remover**:  
   - Removes orphaned and unused packages from the system.  

5. **System Log Cleaner**:  
   - Cleans up old system logs to free storage space.  

6. **Thumbnail Cache Cleaner**:  
   - Removes thumbnail caches to reclaim disk space.  

---

## **Repo structure**

Repo: TheLeftMoose/YALPMS
│
├── .github/workflows/                    # GH action folder
│
├── src/                                  # Source code directory for all scripts
│   ├── bin/                              # Directory for all executable scripts
│   │   ├── install_script.sh             # Installation script
│   │   ├── update_script.sh              # Update script
│   │   ├── cache_cleaner.sh              # Cache cleaner script
│   │   ├── unused_packages_remover.sh    # Unused packages remover script
│   │   ├── system_log_cleaner.sh         # System log cleaner script
│   │   └── thumbnail_cache_cleaner.sh    # Thumbnail cache cleaner script
│   │
│   ├── helpers/                 # Directory for all helper scripts
│   │   ├── detect_env.sh        # Environment detector script
│   │   ├── detect_pm.sh         # Package manager detector script
│   │   └── estimate_storage.sh  # Storage estimator script
│   │
│   └── project-scripts/                               # Directory for all scripts for managing the project
│       └── create-issues-from-enhancements-md.sh      # script to create gh issues from enhancement.md. used by gh action
│
├── docs/                    # Documentation directory
│   ├── README.md            # Main README file for repository
│   ├── usage.md             # Detailed usage instructions for each script
│   ├── architecture.md      # Project design and architecture overview
│   └── enhancements.md      # Description of potential enhancements
│
├── .gitignore              # Git ignore file
├── LICENSE                 # Project license (if applicable)
└── README.md               # Project overview file for GitHub (if different from docs/README.md)

---

## **Modular Scripts**  



## **Modular Scripts**  

### **1. Installation Script**  

#### **Features**  
- Automatically installs the update and cleaner scripts to the appropriate directory.  
- Ensures scripts are executable and available system-wide.  
- Uses **Environment Detector** to ensure compatibility during installation.  

#### **Helper Integration**  
- Calls `detect_env.sh` to determine if the script is being installed on a workstation or server, adapting installation paths accordingly.  

#### Implementation Guidelines
- Use install or cp to place scripts in /usr/local/bin or similar directory.
- Ensure permissions are set to 755 for execution by all users.

#### Input/Output Specifications
- Input: None.
- Output: Success or error messages indicating installation status.

#### **Usage**  
```bash
sudo ./install_script.sh
```  

---

### **2. Update Script**  

#### **Features**  
- Updates cache for all supported package managers (`apt update`, `flatpak`, `snap`).  
- Upgrades all apps for system-wide package managers, including pip (outside virtual environments).  
- Leverages **Package Manager Detector** to dynamically identify and update available package managers.  

#### **Helper Integration**  
- Calls `detect_pm.sh` to detect and iterate through available package managers.  

#### Implementation Guidelines
- Ensure each package manager is called in sequence and error handling is implemented for unsupported managers.
- Include retry logic for network issues.

#### Input/Output Specifications
- Input:
- `--exec`: Executes updates and upgrades.
- `--update-only`: Only refreshes cache.
- Output: List of packages updated/upgraded, or errors encountered.

#### **Usage**  
```bash
./update_script.sh [--exec] [--update-only] 
```

---

### **3. Cache Cleaner**  

#### **Features**  

- Detects available package managers (APT, Snap, Flatpak).  
- Cleans cache for all detected managers.  
- Provides estimated storage savings in dry-run mode using **Storage Estimator**.  

#### **Helper Integration**  

- Calls `detect_pm.sh` to identify package managers with cache data.  
- Uses `estimate_storage.sh` to calculate storage savings during dry runs.  
- Executes `dry_run.sh` for non-destructive simulations.  

#### Implementation Guidelines
- Check for the existence of cache directories for each package manager.
- Implement safeguards to avoid accidental deletion of critical files.

#### Input/Output Specifications
- Input:
  - `--exec`: Executes cache cleanup.
- Output: Summary of cache cleared and space saved (dry-run or actual).

#### **Usage**  
```bash
./cache_cleaner.sh [--exec]  
```  
- `--exec`: Executes cache cleanup.  

---

### **4. Unused Packages Remover**  

#### **Features**  
- Identifies and removes unused or orphaned packages.  
- Supports APT, Snap, and Flatpak.  
- Lists detected unused packages and storage savings in dry-run mode.  

#### **Helper Integration**  
- Calls `detect_pm.sh` to identify relevant package managers.  
- Leverages `estimate_storage.sh` to calculate the impact of removing unused packages.  
- Uses `dry_run.sh` to simulate actions when `--exec` is not specified.  

#### Implementation Guidelines
- Use apt autoremove, flatpak uninstall --unused, and snap remove as applicable.
- Ensure no critical dependencies are removed by mistake.

#### Input/Output Specifications
- Input:
  - `--exec`: Executes removal of unused packages.
- Output: List of removed packages and space saved.

#### **Usage**  
```bash
./unused_packages_remover.sh [--exec]  
```  
- `--exec`: Executes removal of unused packages.  

---

### **5. System Log Cleaner**  

#### **Features**  
- Identifies system logs older than 2 weeks.  
- Displays the storage savings in dry-run mode.  
- Deletes outdated logs when executed.  

#### **Helper Integration**  
- Uses `estimate_storage.sh` to provide storage savings estimates for old logs.  
- Relies on `dry_run.sh` for safe simulations.  

#### Implementation Guidelines

- Use find /var/log -type f -mtime +14 to identify logs older than 2 weeks.
- Ensure write permissions are validated before deletion.

#### Input/Output Specifications
- Input:
  - `--exec`: Executes log cleanup.
- Output: List of deleted logs and space saved.

#### **Usage**  
```bash
./system_log_cleaner.sh [--exec]  
```  
- `--exec`: Executes log cleanup.  

---

### **6. Thumbnail Cache Cleaner**  

#### **Features**  
- Detects and cleans thumbnail cache directories.  
- Displays estimated storage space to be freed.  

#### **Helper Integration**  
- Uses `estimate_storage.sh` to provide storage estimates.  
- Executes `dry_run.sh` for safe, non-destructive mode.  

#### Implementation Guidelines
- Target default thumbnail cache directories (e.g., ~/.cache/thumbnails).
- Validate directories exist before performing operations.

#### Input/Output Specifications
- Input:
  - `--exec`: Executes thumbnail cache cleanup.
- Output: Summary of files deleted and storage saved.


#### **Usage**  
```bash
./thumbnail_cache_cleaner.sh [--exec]  
```  
- `--exec`: Executes thumbnail cache cleanup.  

---

## **Helper Scripts**  

### **1. Environment Detector**  

#### **Features**  
- Identifies if the system is a workstation, server or WSL2.

#### Implementation Guidelines
- Use environment-specific markers (e.g., systemctl for servers) to identify system type.

#### Input/Output Specifications
- Input: None.
- Output: `workstation`, `server` or `wsl`.  

#### **Usage**  
```bash
./detect_env.sh  
```  

---

### **2. Package Manager Detector**  

#### **Features**  
- Detects available package managers (APT, Snap, Flatpak).  
- Returns a list of detected package managers.  

#### Implementation Guidelines
- Check for the presence of executable binaries like apt, snap, and flatpak.

#### Input/Output Specifications
- Input: None.
- Output: List of detected package managers.

#### **Usage**  
```bash
./detect_pm.sh  
```  

---

### **3. Dry-Run Wrapper**  

#### **Features**  
- Provides dry-run capabilities for commands.  
- Displays actions to be performed without executing them.  

#### Implementation Guidelines
- Implement shell wrappers that prepend echo or log actions instead of executing.

#### Input/Output Specifications
- Input: Command to wrap.
- Output: Simulated command output.

#### **Usage**  
```bash
./dry_run.sh <command>  
```  

---

### **4. Storage Estimator**  

#### **Features**  
- Estimates the storage space to be freed by cleanup operations.  
- Breaks down the sizes of individual targets for clarity.  

#### Implementation Guidelines
- Use du -sh to calculate sizes of directories targeted for cleanup.

#### Input/Output Specifications
- Input: Target directories or files.
- Output: Storage size breakdown.

#### **Usage**  
```bash
./estimate_storage.sh <target>  
```  
