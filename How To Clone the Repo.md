# Deploy Key Instructions

This guide explains how to use the provided SSH private key to clone this repository with read-only access.

## Step-by-Step Instructions

1. **Save the Private Key**
   - Copy the private key from the email and save it to a file on your computer, e.g. `~/.ssh/veho-interview-deploy-key`.
   - Ensure ssh won't complain about file permissions:
     ```
     chmod 600 ~/.ssh/veho-interview-deploy-key
     ```

2. **Update Your SSH Config**
   - Open (or create) your SSH config file at `~/.ssh/config` and add the following block:
     ```
     Host github-veho-interview
         HostName github.com
         User git
         IdentityFile ~/.ssh/veho-interview-deploy-key
         IdentitiesOnly yes
     ```

3. **Clone the Repository**
   - Use the following command to clone the repo using the SSH config alias:
     ```sh
     git clone git@github.com:veho-technologies/data-platform-dbt-interview.git
     ```

---

**Note:**

- Please do not share your deploy key.
- If you encounter permission errors, double-check the file permissions and SSH config.

---

# HTTPS Clone Instructions (Collaborator Access)

If you shared your github handle and were temporarily invited as a collaborator, you can clone the repository using HTTPS. 

## Step-by-Step Instructions

1. **Accept the GitHub Invitation**

- Check your email for a GitHub invitation and accept it.

2. **Clone the Repository via HTTPS**

- Use the following command:
  ```
  git clone https://github.com/veho-technologies/data-platform-dbt-interview.git
  ```

3. **Authenticate with GitHub**

- When prompted, log in with your GitHub username and password.

---

**Note:**

- If you encounter permission errors, ensure you have accepted the invitation as a collaborator and are logged in to GitHub.
