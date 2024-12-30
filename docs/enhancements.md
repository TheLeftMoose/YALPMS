# Enhancements - FOR PROMPT ENGINEERING ONLY**  

This document outlines potential enhancements for the **Yet another linux package manager scripts** project. Each enhancement is written in a format that is easy to copy and paste into GitHub Issues.

## **This file purpose**

This file have multiple purposes:

1.  Team members add new enhancements with a defined structure.
    1.  As the template is static, if needed it is possible to get help from other LLMs
    2.  This workflow is considered preparation for getting the enhancement created in GH issues
2.  This repo contains a GH action to automatically create an GH issue when enhancement added to this file
    1.  This Action is only run when this file is changed in main branch after PR merge flow.
    2.  The template includes a field `GH issue sync script status` that is used for this script
    3.  This action and script is ment to be an addon only. This file (enhancements.md) must be able to work without this automation.

---

## **This file automated workflow**



## **Enhancement template**

HThis template provides just the essentials to guide the LLM in filling out the template efficiently.

- **Title**: A clear, concise summary of the enhancement (e.g., "Improve Dry-Run Feedback").
- **Description**: A brief explanation of the enhancement, what it solves, and why it’s valuable. Avoid implementation details.
- **Objective**: What problem is being solved or what benefit is being delivered (e.g., "Make dry-run output more informative").
- **Labels**: Predefined tags like `enhancement`, `usability`, `UX`. Choose appropriate labels based on the enhancement's focus.
- **Milestone**: Target release or iteration (e.g., "Future Release"). Set based on project timeline.
- **GH issue sync script status**: Set to `Pending` when new, and `Completed` when synced to GitHub.

The longer description of each fields can be found last in this document under the *Appendix A. Template long description* section.

---


## **Enhancement Categories**

---

### **1. Usability Enhancements**

### **1.1 Improve Dry-Run Feedback**
- **Title**: Improve Dry-Run Feedback with Detailed Context
- **Description**: Provide more detailed feedback during the dry-run mode, such as simulated changes with contextual explanations for each action (e.g., why a package is being removed or why certain caches are cleared).
- **Objective**: Make dry-run output more informative and useful for end-users, particularly those who are unfamiliar with package management commands.
- **Labels**: `enhancement`, `usability`, `dry-run`
- **Milestone**: Future Release
- **GH issue sync script status**: Pending

---

#### **1.2 Enhanced User Prompts and Interaction**
- **Title**: Add Enhanced User Prompts During Execution
- **Description**: Add user prompts in the terminal that explain each step during execution, e.g., confirming a cleanup action, or displaying a summary of actions to be taken.
- **Objective**: Improve the interactive experience by providing more transparency and control to the user before executing actions.
- **Labels**: `enhancement`, `usability`, `UX`
- **Milestone**: Future Release
- **GH issue sync script status**: Pending

---

### **1.3 fix apt repo errors**
- **Title**: Fix repo errors on sync with repo repos
- **Description**: Some time you encounter errors like "The following signatures were invalid: xxx" or repo don't exist any more. This can be due to seperate repo added in seperate files and package now isn't avilable any more.
- **Objective**: Depending on error, delete file, diable by uncomment, xxx
- **Labels**: `enhancement`, `usability`, `fix-repo-list`
- **Milestone**: Future Release
- **GH issue sync script status**: Pending

---

### **1.4 Move sudo functionality away from script**
- **Title**: Move sudo functionality away from script
- **Description**: sudo should not be run embedded in the script functions but only called when executing the file. 
- **Objective**: Remove sudo from inside the scrip and handle this different. 
- **Labels**: `enhancement`, `usability`, `handle-sudo`
- **Milestone**: Future Release
- **GH issue sync script status**: Pending

---

### **2. Performance Enhancements**

#### **2.1 Parallel Execution of Tasks**
- **Title**: Enable Parallel Execution of Cleanup Tasks
- **Description**: Enable parallel execution of multiple package management tasks (such as cleaning cache and removing unused packages) to reduce overall execution time.
- **Objective**: Optimize the execution time for systems with multiple package managers by leveraging multi-threading or parallel process execution.
- **Labels**: `enhancement`, `performance`, `multi-threading`
- **Milestone**: Future Release

---

#### **2.2 Caching Results for Repeated Actions**
- **Title**: Implement Caching for Repeated Cleanup Tasks
- **Description**: Implement caching for results of commonly repeated actions (e.g., cache cleanups or package updates) to avoid redundant operations on the same system state.
- **Objective**: Reduce execution time by storing the results of prior tasks and reusing them if the same operations are needed in the future.
- **Labels**: `enhancement`, `performance`, `caching`
- **Milestone**: Future Release

---

### **3. Scalability Enhancements**

#### **3.1 Support for Additional Package Managers**
- **Title**: Support for Additional Package Managers (e.g., `yum`, `dnf`)
- **Description**: Expand support for more package managers (e.g., `yum`, `dnf`, `zypper`) to make the tool more versatile and usable across a wider range of Linux distributions.
- **Objective**: Increase the utility of the scripts by including support for other Linux package management systems.
- **Labels**: `enhancement`, `scalability`, `package-managers`
- **Milestone**: Future Release

---

#### **3.2 Multi-System Support (Networked Execution)**
- **Title**: Enable Multi-System Execution via Networked Setup
- **Description**: Enable the scripts to be used on multiple systems simultaneously, either by remote execution or via a networked setup, allowing administrators to clean and manage multiple servers from a single point.
- **Objective**: Support enterprise-level usage where system administrators need to manage and clean package managers across multiple systems at once.
- **Labels**: `enhancement`, `scalability`, `multi-system`, `network`
- **Milestone**: Future Release

---

### **4. Security Enhancements**

#### **4.1 Secure Script Execution (Non-Root Mode)**
- **Title**: Add Secure Non-Root Execution for Scripts
- **Description**: Modify the scripts to allow them to run in a restricted mode (non-root) with appropriate security checks, while ensuring that critical system components are not affected.
- **Objective**: Enhance security by preventing accidental or unauthorized system modifications while still performing useful tasks.
- **Labels**: `enhancement`, `security`, `permissions`
- **Milestone**: Future Release

---

#### **4.2 Improved Logging and Auditing**
- **Title**: Introduce Advanced Logging and Auditing for Script Actions
- **Description**: Introduce an advanced logging mechanism that captures all actions taken by the scripts, including before and after states of the system (e.g., package versions, disk usage).
- **Objective**: Allow users to audit the changes made by the scripts, which is particularly useful for enterprise environments where traceability and accountability are necessary.
- **Labels**: `enhancement`, `security`, `logging`, `audit`
- **Milestone**: Future Release

---

### **5. Documentation and User Guidance Enhancements**

#### **5.1 Interactive Help and Usage Documentation**
- **Title**: Provide Interactive Help for Script Usage
- **Description**: Enhance the usage documentation by providing an interactive guide, such as a terminal-based helper or an online interactive tutorial, that explains the purpose and options of each script in detail.
- **Objective**: Help users understand the functionality and options of each script directly from the terminal or via web-based help.
- **Labels**: `enhancement`, `documentation`, `help`
- **Milestone**: Future Release

---

#### **5.2 Example Use Cases and Best Practices**
- **Title**: Add Example Use Cases and Best Practices to Documentation
- **Description**: Provide a section in the documentation that highlights common use cases, best practices, and tips for running the scripts effectively.
- **Objective**: Assist users in getting the most out of the scripts by providing concrete examples and recommendations.
- **Labels**: `enhancement`, `documentation`, `best-practices`
- **Milestone**: Future Release

---

## **CI/CD Enhancements**

### **6.1 Pester Testing on Merge to Main**
- **Title**: Add Pester Testing on Merge to Main
- **Description**: Configure GitHub Actions to run Pester tests automatically whenever there is a merge to the `main` branch. Ensure that the tests pass before any deployment or further changes are made.
- **Objective**: Improve the reliability of the codebase by automating the testing process on each merge to the main branch.
- **Labels**: `enhancement`, `ci/cd`, `pester`
- **Milestone**: Future Release

---

### **6.2 Package into .deb Locally**
- **Title**: Package the Project into .deb Locally
- **Description**: Create a local GitHub Action to package the project into a `.deb` file for distribution on Debian-based systems. This action will only be triggered locally.
- **Objective**: Automate the creation of a `.deb` package that can be installed easily on Debian-based systems.
- **Labels**: `enhancement`, `ci/cd`, `deb-package`
- **Milestone**: Future Release

---

### **6.3 Proper Release with Semantic Versioning**
- **Title**: Automate Releases with Semantic Versioning
- **Description**: Set up GitHub Actions to automatically generate releases based on semantic versioning (e.g., `v1.0.0`) and tag them in GitHub. Version numbers should be bumped according to the rules of semantic versioning based on commit messages.
- **Objective**: Automate the release process and ensure that versioning is consistent with semantic versioning principles.
- **Labels**: `enhancement`, `ci/cd`, `semver`
- **Milestone**: Future Release

---

## Appendix A. Template long description

To help an LLM understand how to write and enhance new or existing enhancements, we need to add clear context in the template about how to fill out each section. This will guide the LLM in producing quality enhancement proposals that align with the repository's goals.

Here’s how you can expand on the template with additional context for the LLM:

## **Enhancement Template**

Each enhancement should be added using the following template. The LLM should follow this format closely to ensure consistency across all entries.

### **Title**:
- **Context**: The title should be a concise, clear, and descriptive summary of the enhancement. It should immediately convey what the enhancement is about. If the enhancement is related to a specific feature, include the feature name or key functionality in the title. Avoid vague terms like "Improve performance" without specifying what needs improvement (e.g., "Improve Dry-Run Feedback" is better than "Improve performance").

### **Description**:
- **Context**: The description provides a more detailed explanation of the enhancement. The goal is to clearly explain what the enhancement is, how it works, and why it is valuable. Avoid including implementation details here; focus on the high-level benefits. If this is an enhancement to an existing feature, explain the current limitations and how the proposed change will improve the experience or functionality.

    - For new enhancements, describe the issue or gap in functionality the enhancement is addressing.
    - For existing enhancements (status: pending), summarize the current progress or state and specify what needs to be completed or modified.

### **Objective**:
- **Context**: The objective outlines the expected outcome of implementing the enhancement. It should answer the question: What problem is this enhancement solving, or what benefit is it delivering to the users? Keep it focused and measurable.

    - For **new enhancements**, be clear about what the user experience will look like once the enhancement is implemented. For example, "The dry-run output will provide more context for each action performed."
    - For **pending enhancements**, specify what remains to be done and how it will improve the product once completed. For example, "Pending: Complete the implementation of detailed user prompts to ensure clarity in the execution flow."

### **Labels**:
- **Context**: Labels are used to categorize and tag the enhancement for easier identification. Use predefined labels that match common themes, features, or types of work. Here are some examples of common labels:
  - `enhancement` — A general label for enhancements.
  - `usability` — For enhancements that improve the user experience.
  - `performance` — For enhancements aimed at improving speed or resource usage.
  - `bug` — For enhancements that aim to fix bugs or issues.
  - `UX` — For user experience-related enhancements.

    Make sure to check if the enhancement aligns with any of the available labels in the project before adding one. If unsure, use a general label like `enhancement`.

### **Milestone**:
- **Context**: This field is used to track the target release or iteration for the enhancement. It helps prioritize work and sets a timeline for when the feature is expected to be delivered. If the enhancement doesn’t have a set target, use labels like "Future Release" or "Backlog."
  
    - For **new enhancements**, set a milestone based on the desired release cycle or upcoming sprints.
    - For **pending enhancements**, ensure that the milestone reflects any changes in priority or timing based on current project timelines.
    - If no milestone is provided, always set milestone to **future release**.

### **GH Issue Sync Script Status**:
- **Context**: This field helps track the synchronization between the `enhancements.md` file and the GitHub Issues created through the script. The LLM should set this field to `Pending` when the enhancement is just written, or `Completed` once the GitHub issue is successfully created and linked.
  
    - For **new enhancements**, set the status to `Pending` as it will be synced with GitHub after the enhancement is added to the file.
    - For **pending enhancements**, check the current status of the synchronization. If the issue is still pending, keep it as `Pending`. If the GitHub issue is created, update the status to `Completed`.

---

### Example Enhancement Entry (Filled Out):

- **Title**: Improve Dry-Run Feedback with Detailed Context
- **Description**: Provide more detailed feedback during dry-run mode by including contextual explanations for each action performed. For instance, users will see why a package is being removed or why certain caches are being cleared, offering more transparency about the simulated actions.
- **Objective**: Make dry-run output more informative and user-friendly, particularly for those who are unfamiliar with package management commands. This enhancement will help users understand the consequences of the dry-run actions before any actual changes are made.
- **Labels**: `enhancement`, `usability`, `dry-run`
- **Milestone**: Future Release
- **GH issue sync script status**: Pending

---

This additional context ensures that the LLM has a clear understanding of how to craft new enhancement entries or enhance existing ones. It will guide the LLM to produce entries that are complete, actionable, and aligned with the overall goals of the project.